from dashboard.models import Estado, Municipio
from candidato.models import UserRoles_list


def get_states():
    list_states = []
    states = Estado.objects.all()
    for state in states:
        list_states.append((state.Uf, state.Nome))
    return list_states


def get_cities():
    list_cities = []
    cities = Municipio.objects.all()
    for city in cities:
        list_cities.append((city.Codigo, city.Nome))
    return list_cities


def get_cities_by_state(state_id):
    list_cities = []
    try:
        if state_id == str(0):
            cities = Municipio.objects.all()
        else:
            cities = Municipio.objects.filter(Uf=state_id)
        for city in cities:
            list_cities.append((city.Codigo, city.Nome))
    except:
        pass
    list_cities.insert(0, ("", ""))
    return list_cities


def get_user_roles_list():
    user_roles_list = []
    user_roles = UserRoles_list.objects.all()
    print('user_roles', len(user_roles))

    for role in user_roles:
        user_roles_list.append((role.id, role.role_name, role.budget_managment, role.members_managment,
                                role.reports_managment, role.members_access, role.agenda_access,
                                role.sendMessages, role.internetInteraction))

    return user_roles_list
