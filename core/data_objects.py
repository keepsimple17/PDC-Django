from dashboard.models import Estado, Municipio


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

