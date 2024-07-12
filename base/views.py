from django.shortcuts import render, redirect
from .models import Contact, Projects
from django.contrib import messages
from .forms import ContactForm

# Create your views here.
def home(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()

            name = form.cleaned_data['name']

            messages.success(request, f"Thank you for contacting me {name}. Your message has been recorded successfully! I'll get back to you soon.")
            return redirect('home')
    else:
        form = ContactForm()
        return render(request, 'home.html', {'form':form})


def projects(request):
    projects = Projects.objects.all()
    return render(request, 'projects.html', {'projects': projects})