from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    return HttpResponse('Hello, welcome to my Django site!')
# Create your views here.
