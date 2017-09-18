from django.contrib import admin

from .models import Conta, Equipe
# Register your models here.

class ContaAdmin(admin.ModelAdmin):
    list_display = ['nome','sobrenome','email','created_at']
    search_fields = ['nome', 'email']

class EquipeAdmin(admin.ModelAdmin):
    list_display = ['nome','emailEquipe', 'candidato', 'Role']
    search_fields = ['nome', 'emailEquipe', 'candidato']

admin.site.register(Conta, ContaAdmin)
admin.site.register(Equipe, EquipeAdmin)