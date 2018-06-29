from django.contrib import admin
from django import forms

from candidato.models import (
    Candidate, Coalitions, Committees, CommitteeMembers, UserRoles, UserRolesList, ScopeList, Proposal, Keyword)


class CandidateAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'user', 'candidate_political_nickname', 'created_at', 'updated_at')
    filter_horizontal = ('proposals', 'positive_keywords', 'negative_keywords')


class CoalitionsAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'name_coligation', 'political_partie_number', 'political_partie_abbreviation')
    filter_horizontal = ()


class CommitteesAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'name', 'candidate', 'responsible')
    filter_horizontal = ('members', )


class CommitteeMembersAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'commitee', 'usuario', 'assignments', 'observations')
    filter_horizontal = ()


class UserRolesAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'candidate', 'user', 'role_name')
    filter_horizontal = ()


class UserRolesListAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'role_name', 'budget_managment', 'members_managment', 'reports_managment', 'members_access')
    filter_horizontal = ()


class ScopeListAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'name', 'is_template', 'created_at', 'updated_at', 'user')
    filter_horizontal = ()


class ProposalAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'name', 'scope', 'created_at', 'updated_at')
    filter_horizontal = ()


class KeywordAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'keyword', 'type', 'created_at', 'updated_at')
    filter_horizontal = ()


admin.site.register(Candidate, CandidateAdmin)
admin.site.register(Coalitions, CoalitionsAdmin)
admin.site.register(Committees, CommitteesAdmin)
admin.site.register(CommitteeMembers, CommitteeMembersAdmin)
admin.site.register(UserRoles, UserRolesAdmin)
admin.site.register(UserRolesList, UserRolesListAdmin)
admin.site.register(ScopeList, ScopeListAdmin)
admin.site.register(Proposal, ProposalAdmin)
admin.site.register(Keyword, KeywordAdmin)
