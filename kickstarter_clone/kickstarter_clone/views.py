from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from kickstarter_clone.models import Project, RewardTier, Purchase
from kickstarter_clone.forms import RewardTierForm, PurchaseForm, ProjectForm, LoginForm
import ipdb
import datetime

def home_page(request):
    context = {'projects': Project.objects.all() }
    response = render(request, 'index.html', context)
    return HttpResponse(response)

def project_page(request, id):
    project = Project.objects.get(pk=id)
    owner = project.owner
    reward_list = project.reward_tiers.all()
    already_backed = False
    for reward in reward_list:
        for purchase in reward.purchases.all():
            if request.user == purchase.backer:
                already_backed = True
    # Determine deadline
    today = datetime.date.today()
    d0 = today
    d1 = project.end_date
    delta = d1 - d0
    days_left = delta.days
    # Determine funds received
    funds_met = project.total_pledged() - project.funding_goal
    context = {'project': project, "owner":owner, 'today': today, 'days_left': days_left, 'funds_met': funds_met, 'already_backed': already_backed}
    response = render(request, 'project.html', context)
    return HttpResponse(response)

def reward_page(request, id):
    pass

def rewards(request, id):
    project = Project.objects.get(pk=id)
    rewards = project.reward_tiers.all()
    owner = project.owner
    context = {'rewards': rewards, 'owner': owner}
    response = render(request, 'rewards.html', context)
    return HttpResponse(response)

def add_rewards(request, id):
    project = Project.objects.get(pk=id)
    if request.method =='POST':
        form = RewardTierForm(request.POST)
        if form.is_valid():
            add_reward = form.instance
            add_reward.user = request.user
            form.save()
            return HttpResponseRedirect('/project/{}/rewards/'.format(project.id))
    else:
        form = RewardTierForm()
        context = {'form':form, 'project':project}
        response = render(request,'add_rewards.html', context)
        return HttpResponse(response)


def edit_reward(request, id):
    reward = RewardTier.objects.get(pk=id)
    project = reward.project
    if request.method == 'GET':
        form = RewardTierForm(instance=reward)
        context = {'reward': reward, 'form': form }
        response = render(request, 'edit_reward.html', context)
        return HttpResponse(response)
    elif request.method == 'POST':
        form = RewardTierForm(request.POST, instance=reward)
        if form.is_valid():
            edited_reward = form.save()
            return HttpResponseRedirect('/project/{}/rewards/'.format(project.id))
        else:
            context = {'form': form, 'reward': reward }
            response = render(request, 'edit_reward.html', context)
            return HttpResponse(response)

def purchase_reward(request, id):
    reward = RewardTier.objects.get(pk =id)
    project = reward.project
    # form_dict = {'backer':request.user, 'reward_tier':reward}
    # purchase = Purchase.objects.create(backer=request.user, reward_tier=reward)
    form = PurchaseForm(request.POST)
    # ipdb.set_trace()
    if form.is_valid():
        new_purchase = form.save()
        return HttpResponseRedirect('/project/{}'.format(project.id))



@login_required
def new_project(request):
    if request.method == 'POST':
        form = ProjectForm(request.POST)
        if form.is_valid():
            new_project = form.save()
            new_project.owner = request.user
            new_project.save()
            return HttpResponseRedirect('/project/{}'.format(new_project.id))
    else:
        form = ProjectForm()
    return render(request, 'create_page.html', {'form': form})


def login_view(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect('/home')
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

def signup(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect('/home')
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return HttpResponseRedirect('/home')
    else:
        form = UserCreationForm()
    html_response = render(request, 'signup.html', {'form': form})
    return HttpResponse(html_response)

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/home')


def profile_show(request, id):
    profile = User.objects.get(pk=id)

    total_backed = 0
    backed_projects = []
    for purchase in profile.purchases.all():
        total_backed += purchase.reward_tier.tier_value
        if purchase.reward_tier.project not in backed_projects:
            backed_projects.append(purchase.reward_tier.project)
    context = {'profile': profile, 'total': total_backed, 'backed_projects': backed_projects}
    response = render(request, 'profile_page.html', context)
    return HttpResponse(response)
