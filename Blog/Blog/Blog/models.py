from django.db import models
from django.contrib.auth.models import User
from datetime import datetime, date


class Article(models.Model):
    title = models.CharField(max_length=255)
    body = models.TextField()
    draft = models.BooleanField()
    published_date = models.DateField()
    author = models.CharField(max_length=255)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='articles', default=1)

    def __str__(self):
        return self.title + "by" + self.author
