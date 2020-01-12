from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from paperboy.models import Paperboy

def home(request):
    earnings = "{:10.2f}".format(Paperboy.total_earnings())
    context = {'paperboys': Paperboy.objects.all(), 'total_papers': Paperboy.total_papers(), 'total_earnings': earnings}
    return HttpResponse(render(request, 'index.html', context))

def deliver(request, id):
    pb = Paperboy.objects.get(pk=id)
    context = {'paperboy': pb}
    response = render(request, 'pb.html', context)
    return HttpResponse(response)
