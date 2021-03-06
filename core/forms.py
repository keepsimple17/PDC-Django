import django.forms as forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from core.data_objects import get_states, get_cities, get_cities_by_state
from dashboard.models import Usuario, Estado, Municipio
from candidato.models import Candidate, UserRolesList, CANDIDATE_POSITION_CHOICES, CANDIDATE_CURRENT_POSITION

from cep.widgets import CEPInput


# use these form classes to enforce unique emails, if required
class UniqueEmailForm:
    def clean_email(self):
        qs = User.objects.filter(email=self.cleaned_data['email'])
        if self.instance:
            qs = qs.exclude(pk=self.instance.pk)
        if qs.count():
            raise forms.ValidationError('Esse endereço de email já esta em uso.')
        else:
            return self.cleaned_data['email']


class UserForm(UserCreationForm, UniqueEmailForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.', required=False)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )
        widgets = {
            'first_name': forms.TextInput(attrs={'class': "form-control"}),
            'last_name': forms.TextInput(attrs={'class': "form-control"}),
            'email': forms.TextInput(attrs={'class': "form-control validate"}),
        }


class CandidateForm(forms.ModelForm):
    choice_states = get_states()
    choice_cities = get_cities()
    choice_states.insert(0, (None, "Insira seu Estado"))
    choice_cities.insert(0, (None, "Insira sua Cidade"))

    choice_states = tuple(choice_states)
    choice_cities = tuple(choice_cities)

    candidate_political_nickname = forms.CharField(max_length=40, required=False, help_text='Optional.')
    candidate_party = forms.CharField(max_length=40, required=False, help_text='Optional.')
    candidate_dispute_number = forms.CharField(max_length=40, required=False, help_text='Optional.')
    campaign_email = forms.EmailField(
        max_length=254, help_text='Required. Inform a valid email address.', required=False)
    # political_position = forms.CharField(max_length=40, required=False, help_text='Optional.')
    reelection = forms.CharField(required=False, max_length=4)
    holds_political_position = forms.CharField(required=False, max_length=4)
    first_election = forms.CharField(required=False, max_length=4)
    candidate_site = forms.CharField(max_length=50, required=False)
    twitter = forms.CharField(max_length=40, required=False)
    twitter_img = forms.CharField(required=False)
    twitter_url = forms.CharField(required=False)
    facebook = forms.CharField(max_length=40, required=False)
    facebook_img = forms.CharField(required=False)
    facebook_url = forms.CharField(required=False)
    googlep = forms.CharField(max_length=40, required=False)
    googlep_img = forms.CharField(required=False)
    googlep_url = forms.CharField(required=False)
    youtube = forms.CharField(max_length=40, required=False)
    youtube_img = forms.CharField(required=False)
    youtube_url = forms.CharField(required=False)
    instagram = forms.CharField(max_length=40, required=False)
    instagram_img = forms.CharField(required=False)
    instagram_url = forms.CharField(required=False)
    candidate_blog_rss = forms.CharField(max_length=40, required=False)
    candidate_blog_rss_img = forms.CharField(required=False)
    candidate_blog_rss_url = forms.CharField(required=False)
    canditate_Election_Ballot = forms.CharField(max_length=50, required=False, help_text='Optional')
    slug = forms.CharField(max_length=50, required=False, help_text='Optional')
    candidate_state = forms.ChoiceField(
        required=False, help_text='Optional', choices=choice_states,
        widget=forms.Select(attrs={'class': 'form-control select', 'id': 'candidate_state'}))
    candidate_city = forms.ChoiceField(
        required=False, help_text='Optional', choices=choice_cities,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'candidate_city'}))
    holds_position = forms.CharField(max_length=50, required=False, help_text='Optional')
    candidate_desired_position = forms.ChoiceField(
        choices=CANDIDATE_POSITION_CHOICES, required=False, help_text='Optional')
    candidate_current_position = forms.ChoiceField(
        choices=CANDIDATE_CURRENT_POSITION, required=False, help_text='Optional')
    resume = forms.FileField(required=False)

    class Meta:
        model = Candidate
        fields = (
            'candidate_political_nickname', 'candidate_dispute_number', 'campaign_email',
            'reelection', 'candidate_site', 'facebook', 'facebook_img', 'facebook_url', 'twitter', 'twitter_img',
            'twitter_url', 'googlep', 'googlep_img', 'googlep_url', 'youtube', 'youtube_img', 'youtube_url',
            'instagram', 'instagram_img', 'instagram_url', 'candidate_blog_rss', 'candidate_blog_rss_img',
            'candidate_blog_rss_url', 'canditate_Election_Ballot', 'candidate_desired_position', 'slug',
            'candidate_state', 'candidate_city', 'holds_position', 'candidate_current_position', 'first_election',
            'candidate_party', 'holds_political_position', 'resume',
        )
        widgets = {
            'candidate_political_nickname': forms.TextInput(attrs={'class': "form-control"}),
            'candidate_dispute_number': forms.TextInput(attrs={'class': "form-control"}),
            'political_position': forms.TextInput(attrs={'class': "form-control"}),
            'campaign_email': forms.TextInput(attrs={'class': "form-control validate"}),
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
    def __init__(self, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)
        self.fields['cidade'].choices = get_cities_by_state()
        if len(args) == 0:
            self.fields['cidade'].choices = get_cities_by_state()
        else:
            self.fields['cidade'].choices = get_cities_by_state(args[0]['estado'])
        self.fields['cidade'].choices = get_cities_by_state()

    choice_states = get_states()
    # choice_cities = get_cities()
    choice_states.insert(0, (None, "Insira seu Estado"))
    # choice_cities.insert(0, (None, "Insira sua Cidade"))

    choice_states = tuple(choice_states)
    # choice_cities = tuple(choice_cities)
    estado = forms.ChoiceField(choices=choice_states, required=False, help_text='Optional.',
                               widget=forms.Select(attrs={'class': 'form-control select'}))

    cidade = forms.ChoiceField(required=False, help_text='Optional.',
                               widget=forms.Select(attrs={'class': 'form-control'}))
    address = forms.CharField(max_length=255, required=False, help_text='Optional')
    company = forms.CharField(max_length=255, required=False, help_text='Optional')
    gender = forms.CharField(max_length=1, required=False, help_text='Optional')
    marital_status = forms.CharField(max_length=1, required=False, help_text='Optional')
    cpf = forms.CharField(max_length=11, required=False, help_text='Optional')
    birthday_date = forms.CharField(required=False, help_text='Optional')
    bairro = forms.CharField(max_length=255, required=False, help_text='Optional')
    cellPhone = forms.CharField(max_length=17, required=False, help_text='Optional')
    landlinePhone = forms.CharField(max_length=17, required=False, help_text='Optional')
    user_political_party = forms.CharField(max_length=50, required=False, help_text='Optional')

    user_roles_list = forms.ModelChoiceField(queryset=UserRolesList.objects.all(), required=False)
    cep = forms.CharField(
        required=False, label=u"CEP", help_text="Format: XXXXX-XXX", widget=CEPInput(address={
            'state': 'id_estado',
            'city': 'id_cidade',
            'street': 'id_address'}))
    user_profile_photo = forms.ImageField(required=False)

    class Meta:
        model = Usuario
        exclude = ['user']

        # fields = ('candidate_name', 'candidate_political_party', 'cellPhone','estado','cidade','address','cep')
        fields = ('estado', 'cidade', 'address', 'company', 'gender', 'marital_status',
                  'cpf', 'cellPhone', 'landlinePhone', 'user_political_party', 'user_roles_list', 'birthday_date',
                  'bairro', 'cep', 'user_profile_photo')
        widgets = {
            # 'candidate_name': forms.TextInput(attrs={'class': "form-control"}),
            # 'candidate_political_party': forms.Select(attrs={'class': 'form-control'}),
            'cellPhone': forms.TextInput(attrs={'class': "form-control validate"}),
        }
