from dashboard.models import Estado, Municipio, PoliticalParties
from candidato.models import UserRolesList, ScopeList
from django.db.models import Q


def get_states():
    list_states = []
    states = Estado.objects.all().order_by('Nome')
    for state in states:
        list_states.append((state.Uf, state.Nome))
    return list_states


def get_cities():
    list_cities = []
    cities = Municipio.objects.all().order_by('Nome')
    for city in cities:
        list_cities.append((city.Codigo, city.Nome))
    return list_cities


def get_cities_by_state(state_id=''):
    # print('state_id->', state_id)
    list_cities = []
    try:
        if state_id == str(0) or state_id is None or state_id == '':
            cities = Municipio.objects.all().order_by('Nome')
        else:
            cities = Municipio.objects.filter(Uf=state_id).order_by('Nome')
        for city in cities:
            list_cities.append((city.Codigo, city.Nome))
    except:
        pass
    list_cities.insert(0, ("", ""))
    return list_cities


def get_user_roles_list():
    user_roles_list = []
    user_roles = UserRolesList.objects.all()

    for role in user_roles:
        user_roles_list.append((role.id, role.role_name, role.budget_managment, role.members_managment,
                                role.reports_managment, role.members_access, role.agenda_access,
                                role.sendMessages, role.internetInteraction))

    return user_roles_list


def get_political_parties():
    political_parties = []
    political_party_list = PoliticalParties.objects.all()

    # The user or employee that will have access, sometimes doesn't have a political party
    # Or even the candidate can be independent
    political_parties.append(('Nenhum', 'Nenhum'))
    for item in political_party_list:
        political_parties.append((item.sigla, item.name))

    return political_parties


def get_scope_template(user_id=None):
    scopes = []

    if user_id:
        scopes_list = ScopeList.objects.filter(Q(is_template=True) | Q(user_id=user_id)).order_by('name')
    else:
        scopes_list = ScopeList.objects.filter(is_template=True).order_by('name')

    for scope in scopes_list:
        scopes.append((scope.id, scope.name))

    scopes.insert(0, ("create", "Criar nova Categoria"))
    return scopes
