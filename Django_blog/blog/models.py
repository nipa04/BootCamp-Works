from django.db import models
from django import forms
from django.core.validators import MinLengthValidator
from django.core.exceptions import ValidationError
from datetime import datetime, date
from django.contrib.auth.models import User



class Article(models.Model):
    title = models.CharField(max_length=255)
    body = models.TextField()
    draft = models.BooleanField()
    published_date = models.DateField()
    author = models.CharField(max_length=255)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='articles', default=1)

    def __str__(self):
        return self.title + " by " + self.author


def draft_date(value):
    today = date.today()
    if Article.draft == True and value < today:
        raise ValidationError('Date must be in the future.')
    elif Article.draft == False and value > today:
        raise ValidationError('Date cannot bein the future')

def no_future(value):
    today = date.today()
    if value > today:
        raise ValidationError('Purchase_Date cannot be in the future.')



class Topic(models.Model):
    name = models.CharField(max_length=255, default='topic')
    article = models.ForeignKey(Article, on_delete=models.CASCADE, related_name='topic')

    def __str__(self):
        return self.name


class Comment(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    message = models.TextField()
    article = models.ForeignKey(Article, on_delete=models.CASCADE, related_name='comments')

    def __str__(self):
        return self.name
