from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from photogur.models import Picture, Comment
from photogur.forms import LoginForm, PictureForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required


def root(request):
    return HttpResponseRedirect('/pictures')

def picture_page(request):
    context = {'pictures': Picture.objects.all()}
    response = render(request, 'pictures.html', context)
    return HttpResponse(response)

def picture_show(request, id):
    picture = Picture.objects.get(pk = id)
    context = {'picture': picture}
    response = render(request, 'picture.html', context)
    return HttpResponse(response)

def picture_search(request):
    query = request.GET['query']
    search_results = Picture.objects.filter(artist=query)
    context = {'pictures': search_results, 'query': query}
    response = render(request, 'picture_search.html', context)
    return HttpResponse(response)

def create_comment(request):
    picture = request.POST['picture']
    comment_name = request.POST['comment-name']
    comment_message = request.POST['comment-message']
    comment = Comment.objects.create(picture=Picture.objects.get(id=picture), name=comment_name, message=comment_message)
    return HttpResponseRedirect('/pictures/' + picture)

def login_view(request):
    # form = LoginForm()
    # context = {'form': form}
    # http_response = render(request, 'login.html', context)
    # return HttpResponse(http_response)
    if request.user.is_authenticated:
        return HttpResponseRedirect('/pictures')

    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            pw = form.cleaned_data['password']
            user = authenticate(username=username, password=pw)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect('/pictures')
            else:
                form.add_error('username', 'Login failed')
    else:
        form = LoginForm()

    context = {'form': form}
    http_response = render(request, 'login.html', context)
    return HttpResponse(http_response)

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/pictures')


def signup(request):
    # form = UserCreationForm()
    # html_response =  render(request, 'signup.html', {'form': form})
    # return HttpResponse(html_response)
    if request.user.is_authenticated:
        return HttpResponseRedirect('/pictures')

    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return HttpResponseRedirect('pictures')
    else:
        form = UserCreationForm()

    html_response =  render(request, 'signup.html', {'form': form})
    return HttpResponse(html_response)

@login_required
def new_picture(request):
    if request.method == 'POST':
        form = PictureForm(request.POST)
        if form.is_valid():
            form.user = request.user
            form.save()
            return HttpResponseRedirect('/pictures')
    else:
        form = PictureForm()

    context = {'form': form}
    response = render(request, 'new_picture.html', context)
    return HttpResponse(response)


@login_required
def edit_picture(request, id):
    picture = get_object_or_404(Picture, pk=id, user=request.user.pk)

    if request.method == 'POST':
        form = PictureForm(request.POST, instance=picture)
        if form.is_valid():
            form.user = request.user
            form.save()
            return HttpResponseRedirect('/pictures/' + str(picture.id))
    else:
        form = PictureForm(instance=picture)

    context = {'picture': picture,'form': form}
    response = render(request, 'edit_picture.html', context)
    return HttpResponse(response)
