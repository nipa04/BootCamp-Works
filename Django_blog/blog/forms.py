from django import forms
from django.forms import CharField, PasswordInput, Form
from .models import Article, Topic, Comment

class LoginForm(forms.Form):
    username = forms.CharField(label="User name", max_length=64)
    password = forms.CharField(widget=forms.PasswordInput())

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['name', 'message', 'article']

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ['title', 'body', 'draft', 'published_date', 'author']
