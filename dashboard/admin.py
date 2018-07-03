from django.contrib import admin

from dashboard.models import (Usuario, PoliticalParties, Estado, Municipio, Bairro, RelationshipNetwork)


class UsuarioAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'user', 'gender', 'address', 'cellPhone', 'landlinePhone', 'cep', 'estado', 'cidade', 'bairro',)
    filter_horizontal = ('candidates', )


class PoliticalPartiesAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'sigla', 'name', 'president_name')
    filter_horizontal = ()


class EstadoAdmin(admin.ModelAdmin):
    list_display = ('CodigoUf', 'Nome', 'Uf', 'Regiao')
    filter_horizontal = ()


class MunicipioAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'Codigo', 'Nome', 'Uf')
    filter_horizontal = ()


class BairroAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'Codigo', 'Nome', 'Uf')
    filter_horizontal = ()


class RelationshipNetworkAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'id_actor_a', 'kind_of_relationship', 'id_actor_b')
    filter_horizontal = ()


admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(PoliticalParties, PoliticalPartiesAdmin)
admin.site.register(Estado, EstadoAdmin)
admin.site.register(Municipio, MunicipioAdmin)
admin.site.register(Bairro, BairroAdmin)
admin.site.register(RelationshipNetwork, RelationshipNetworkAdmin)
