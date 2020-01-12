from django.forms import CharField, PasswordInput, Form
from django import forms
from django.db import models
from photogur.models import Picture, Comment

class LoginForm(forms.Form):
    username = CharField(label="User Name", max_length=64)
    password = CharField(widget=PasswordInput())

class PictureForm(forms.ModelForm):
    class Meta:
        model = Picture
        fields = ['title', 'artist', 'url', 'user']
