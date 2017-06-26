from django import forms
from django.contrib.auth.forms import AuthenticationForm

class UserLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

class LoginForm(AuthenticationForm):
    username = forms.CharField(label="Username", max_length=30,
                               widget=forms.TextInput(attrs={'class': 'form-control input-lg', 'name': 'username',
                                                             'id':'username','placeholder':'Usuario'}))
    password = forms.CharField(label="Password", max_length=30,
                               widget=forms.PasswordInput(attrs={'class': 'form-control input-lg', 'name': 'password',
                                                             'placeholder':'Senha','id':'password'}))
