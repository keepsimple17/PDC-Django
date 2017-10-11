from django import forms

Class InformaEvento(forms.Form):
    Importancia = forms.IntegerField(label="Importância")
    origem = forms.IntegerField(label="Origem")
    title = forms.CharField(label="Nome Evento", max_length=30)
    slug = forms.SlugField(label="Atalho")
    reference = forms.CharField(label="Referência", max_length=40)
    mensagem = forms.CharField(label="Resumo Evento", widget=forms.Textarea)
    about = forms.CharField(label="Sobre o Evento", widget=forms.Textarea)
