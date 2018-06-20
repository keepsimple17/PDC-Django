from django.contrib import admin

from dashboard.models import (Usuario, PoliticalParties, Estado, Municipio, Bairro, RelationshipNetwork)


class UsuarioAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'user', 'gender', 'address', 'cellPhone', 'landlinePhone', 'cep', 'estado', 'cidade', 'bairro',)


class PoliticalPartiesAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'sigla', 'name', 'president_name')


class EstadoAdmin(admin.ModelAdmin):
    list_display = ('CodigoUf', 'Nome', 'Uf', 'Regiao')


class MunicipioAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'Codigo', 'Nome', 'Uf')


class BairroAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'Codigo', 'Nome', 'Uf')


class RelationshipNetworkAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'id_actor_a', 'kind_of_relationship', 'id_actor_b')


admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(PoliticalParties, PoliticalPartiesAdmin)
admin.site.register(Estado, EstadoAdmin)
admin.site.register(Municipio, MunicipioAdmin)
admin.site.register(Bairro, BairroAdmin)
admin.site.register(RelationshipNetwork, RelationshipNetworkAdmin)
