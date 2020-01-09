from django.contrib import admin
from kickstarter_clone.models import Project, RewardTier, Purchase

admin.site.register(Project)
admin.site.register(RewardTier)
admin.site.register(Purchase)
