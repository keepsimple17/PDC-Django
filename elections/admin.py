from django.contrib import admin

from elections.models import Ballot, Position, Dispute


class BallotAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'name', 'election_date', 'created')


class PositionAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'ballot', 'position', 'kind_of_position', 'uf', 'citie', 'created')


class DisputeAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'position', 'state', 'citie', 'candidate', 'created')


admin.site.register(Ballot, BallotAdmin)
admin.site.register(Position, PositionAdmin)
admin.site.register(Dispute, DisputeAdmin)
