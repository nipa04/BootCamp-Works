from django.http import HttpResponse, HttpResponseRedirect
from Blog.models import Article
from django.shortcuts import render, redirect, get_object_or_404
import datetime


def root(request):
    return HttpResponseRedirect('/home')

def home_page(request):
    now = str(datetime.datetime.now())
    articles = Article.objects.filter(draft=False).order_by('-published_date').all()
    context = {'name': 'Farjana', 'day': now, 'articles': articles}
    response = render(request, 'index.html', context)
    return HttpResponse(response)
