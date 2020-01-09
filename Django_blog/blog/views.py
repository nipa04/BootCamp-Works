from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from blog.models import Article, Topic, Comment
from django.contrib.auth import authenticate, login, logout
from blog.forms import LoginForm, ArticleForm, CommentForm
from django.contrib.auth.decorators import login_required



def root(request):
    return HttpResponseRedirect('/home')


def home_page(request):
    articles = Article.objects.filter(draft=False).order_by('-published_date').all()
    context = {'articles': articles}
    response = render(request, 'blog.html', context)
    return HttpResponse(response)


def article_details(request,id):
    article = Article.objects.get(pk=id)
    context = {'article': article}
    response = render(request, 'article.html', context)
    return HttpResponse(response)

@login_required
def new_article(request):
    context = {'form': ArticleForm()}
    response = render(request, 'new_article.html', context)
    return HttpResponse(response)


def create_comment(request):
    form = CommentForm(request.POST)
    if form.is_valid():
        new_comment = form.save()
        return HttpResponseRedirect('/home')
    else:
        messages.error(request, form.errors)
        return render(request, 'article.html', {'form': CommentForm()})


# def create_comment(request):
#     article = request.POST['article']
#     comment_name = request.POST['comment-name']
#     comment_message = request.POST['comment-message']
#     comment = Comment.objects.create(article=Article.objects.get(id=article), name=comment_name, message=comment_message)
#     return HttpResponseRedirect('/articles/' + article)

def create_article(request):
    form = ArticleForm(request.POST)
    if form.is_valid():
        new_article = form.save()
        return HttpResponseRedirect('/home')
    else:
        messages.error(request, form.errors)
        return render(request, 'new_article.html', {'form':ArticleForm()})


def login_view(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect('/articles')
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            pw = form.cleaned_data['password']
            user = authenticate(username=username, password=pw)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect('/home')
            else:
                form.add_error('username', 'Login failed')
    else:
        form = LoginForm()
    context = {'form': form}
    response = render(request, 'login.html', context)
    return HttpResponse(response)


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/home')


@login_required
def edit_article(request, id):
    article = get_object_or_404(Article, pk = id, user = request.user.pk)

    if request.method == 'GET':
        form = ArticleForm(instance=article)
        context = {'form':form, 'article':article}
        return render(request, 'edit_article.html', context)

    elif request.method == 'POST':
        form = ArticleForm(request.POST, instance=article)
        if form.is_valid():
            edit_article = form.save()
            return HttpResponseRedirect('/articles/'+str(article.pk))
        else:
            context = {'form':form, 'article':article}
            return render(request, 'edit_article.html', context)
            HttpResponse(response)
