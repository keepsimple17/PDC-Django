import django.forms as forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from dashboard.models import Profile

class UserForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )
        widgets = {
            'first_name': forms.TextInput(attrs={'class': "form-control"}),
            'last_name': forms.TextInput(attrs={'class': "form-control"}),
            'email': forms.TextInput(attrs={'class': "form-control validate"}),
        }

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('candidate_name', 'candidate_political_party', 'cellPhone')
        widgets = {
            'candidate_name': forms.TextInput(attrs={'class': "form-control"}),
            'candidate_political_party': forms.Select(attrs={'class': 'form-control'}),
            'cellPhone': forms.TextInput(attrs={'class': "form-control validate"}),
        }