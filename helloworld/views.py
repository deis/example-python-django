import os

from django.http import HttpResponse


def home(request):
    return HttpResponse('Powered by {}'.format(os.getenv('POWERED_BY', 'Deis')))
