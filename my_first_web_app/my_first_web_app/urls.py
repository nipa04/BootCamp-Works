"""my_first_web_app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from my_first_web_app.views import root
from my_first_web_app.views import home_page
from my_first_web_app.views import gallery_page
from my_first_web_app.views import about_me
from my_first_web_app.views import favourite_pages


urlpatterns = [
    path('', root),
    path('home/', home_page),
    path('gallery/', gallery_page),
    path('about_me/', about_me),
    path('favourites/', favourite_pages)
]
