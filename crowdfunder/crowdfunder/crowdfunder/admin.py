from django.contrib import admin
from .models import Project, Reward, Backer, Category , Comment

admin.site.register(Project)
admin.site.register(Reward)
admin.site.register(Backer)
admin.site.register(Category)
admin.site.register(Comment)
