from django import forms
from .models import Contact

class ContactForm(forms.ModelForm):
    name = forms.CharField(required=True, widget=forms.widgets.TextInput(attrs={"placeholder":"Your name", "class":"form-control"}), label="Name")
    email = forms.CharField(required=True, widget=forms.widgets.TextInput(attrs={"placeholder":"Your Email", "class":"form-control"}), label="Email Address")
    number = forms.CharField(required=True, widget=forms.widgets.TextInput(attrs={"placeholder":"Your phone number", "class":"form-control"}), label="Phone Number")
    message = forms.CharField(required=True, widget=forms.widgets.TextInput(attrs={"placeholder":"", "class":"form-control"}), label="Message")

    class Meta:
        model = Contact
        fields = ('name', 'email', 'number', 'message')
