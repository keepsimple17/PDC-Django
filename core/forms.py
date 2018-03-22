import django.forms as forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from core.data_objects import get_states, get_cities
from dashboard.models import Usuario, Estado, Municipio
from candidato.models import Candidate

from cep.widgets import CEPInput


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


class UserUpdateForm(forms.ModelForm):

    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')
        widgets = {
            'first_name': forms.TextInput(attrs={'class': "form-control"}),
            'last_name': forms.TextInput(attrs={'class': "form-control"}),
            'email': forms.TextInput(attrs={'class': "form-control validate"}),
        }


class ProfileForm(forms.ModelForm):
    choice_states = get_states()
    choice_cities = get_cities()
    choice_states.insert(0, (None, "enter state"))
    choice_cities.insert(0, (None, "enter city"))

    choice_states = tuple(choice_states)
    choice_cities = tuple(choice_cities)
    estado = forms.ChoiceField(choices=choice_states, required=False, help_text='Optional.')
    cidade = forms.ChoiceField(choices=choice_cities, required=False, help_text='Optional.')
    address = forms.CharField(max_length=255, required=False, help_text='Optional')
    cep = forms.CharField(label=u"CEP",
                          help_text="Format: XXXXX-XXX",
                          widget=CEPInput(address={
                                                 'state': 'id_estado',
                                                 'city': 'id_cidade',
                                                 'street': 'id_address',
                                                 }))

    class Meta:
        model = Usuario
<<<<<<< HEAD
        #fields = ('candidate_name', 'candidate_political_party', 'cellPhone','estado','cidade','address','cep')
        fields = ('cellPhone', 'estado', 'cidade', 'address', 'cep')
=======
        fields = ('candidate_name', 'candidate_political_party', 'cellPhone', 'estado', 'cidade', 'address', 'cep')
>>>>>>> 07006db9297223dcb74ba1d9b17985329b8297c9
        widgets = {
            #'candidate_name': forms.TextInput(attrs={'class': "form-control"}),
            #'candidate_political_party': forms.Select(attrs={'class': 'form-control'}),
            'cellPhone': forms.TextInput(attrs={'class': "form-control validate"}),
        }
<<<<<<< HEAD


    # Due duplication, the Candidate information is in candidato.models.Candidate. The widgets must been set from there
=======
>>>>>>> 07006db9297223dcb74ba1d9b17985329b8297c9
