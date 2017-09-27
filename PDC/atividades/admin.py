from django.contrib import admin

from .models import Evento

class EventoAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'origem', 'created_at']
    search_fields = ['title','mensagem']
    prepopulated_fields = {'slug':('title',)}

admin.site.register(Evento,EventoAdmin)