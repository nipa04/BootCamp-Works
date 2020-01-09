from random import randint
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render

def root(request):
    return HttpResponseRedirect('gallery')

def home_page(request):
    context = {'name': 'Farjana Nipa'}
    response = render(request, 'index.html', context)
    return response

def gallery_page(request):
    image_urls = []
    for i in range(5):
        random_number = randint(0, 100)
        image_urls.append("https://picsum.photos/400/600/?image={}".format(random_number))
    context = {'gallery_images': image_urls}
    response = render(request, 'gallery.html', context)
    return HttpResponse(response)

def about_me(request):
    context = {'skills': ['html', 'css', 'python', 'javascript'], 'interests': ['movies', 'songs', 'cricket']
     }
    response = render(request, 'about_me.html', context)
    return HttpResponse(response)

def favourite_pages(request):
    
    context = {'fave_links': ['https://www.reddit.com/', 'https://www.goodreads.com/', 'https://www.vice.com/en_ca']}
    reposnse = render(request, 'favourites.html', context)
    return HttpResponse(reposnse)
