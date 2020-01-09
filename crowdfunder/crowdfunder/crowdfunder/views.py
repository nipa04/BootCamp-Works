from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from .models import Project, Reward, User, Backer, Category, Comment
from .forms import RewardsForm, ProjectForm, LoginForm, BackersForm, CommentForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404


def root(request):
    return HttpResponseRedirect('/projects')


def project_view(request):
    project = Project.objects.all()
    context = {
        'project': project
    }
    response = render(request, 'projectpage.html', context)
    return HttpResponse(response)

def project_create(request):
    if request.method == 'POST':
        form = ProjectForm(request.POST)
        if form.is_valid():
            new_project = form.instance
            new_project.user = request.user
            new_project.save()
            return HttpResponseRedirect('/projects/')
    else:
        form = ProjectForm(initial={'owner': request.user})
    html_response = render(request, 'projectcreate.html', {'form': form})
    return HttpResponse(html_response)

def project_show(request, id):
    project = Project.objects.get(pk=id)
    reward = project.rewards.all()
    backer = project.backers.all()

    if request.method == 'POST':
        rewards_form = RewardsForm(request.POST)
        backer_form = BackersForm(request.POST)
        if rewards_form.is_valid():
            new_reward = rewards_form.save()
        elif backer_form.is_valid():
            new_backer = backer_form.save()
            return HttpResponseRedirect('/projects/{}'.format(id))
        else:
            # put some errors
            pass
    else:
        rewards_form = RewardsForm(initial={'project': id})
        backer_form = BackersForm(initial={'project': id, 'user': request.user})


    context = {
        'project': project,
        'backer': backer,
        'reward': reward,
        'rewards_form': rewards_form,
        'backer_form': backer_form,
    }
    response = render(request, 'projectshow.html', context)
    return HttpResponse(response)

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            pw = form.cleaned_data['password']
            user = authenticate(username=username, password=pw)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect('/projects/')
            else:
                form.add_error('username', 'Login Failed')
    else:
        form = LoginForm()
    context = {
        'form': form
    }
    response = render(request, 'login.html', context)
    return HttpResponse(response)


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/projects/')


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return HttpResponseRedirect('/projects/')
    else:
        form = UserCreationForm()
    html_response = render(request, 'signup.html', {'form': form})
    return HttpResponse(html_response)


def catagorie_search(request):
    query = request.GET['query']
    search_result = Project.objects.filter(catagories__icontains=query)
    context = {
        'search_result': search_result,
        'query': query
    }
    response = render(request, 'search.html', context)
    return HttpResponse(response)

def profile_show(request, id):
    return render(request, 'profile.html', {
        'user': User.objects.get(pk=id)
    })

def profile(request):
    return render(request, 'users/profile.html')

def category(request, id):
    category = Category.objects.get(pk=id)
    projects = category.projects.all()
    context = {
        'category': category,
        'projects': projects
        }
    return render(request, 'category.html', context)

def category_view(request):
    categories = Category.objects.all()
    response = render(request, 'category_view.html', {'categories': categories})
    return HttpResponse(response)

def delete_project(request, id):
    project = get_object_or_404(Project, pk=id, user=request.user.pk)
    project.delete()
    return HttpResponseRedirect('/projects/')


def create_comment(request):
    form = CommentForm(request.POST)
    if form.is_valid():
        new_comment = form.save()
        return HttpResponseRedirect('/projects')
    else:
        messages.error(request, form.errors)
        return render(request, 'projectshow.html', {'form': CommentForm()})
