from candidato.models import Committees


def get_committes(candidator):
    committees = []
    committees_list = Committees.objects.filter(candidate=candidator)
    for committee in committees_list:
        body = {
            'name': committee.name,
            'cell_phone': committee.cell_phone,
            'address': committee.address,
        }
        if committee.responsible_tmp:
            body['resonable_name'] = committee.responsible_tmp.username
        if committee.responsible:
            body['resonable_name'] = committee.responsible.username
        committees.append(body)
    return committees


def avail_candidator_step(id):
    print('id', id)
    # Candidato
    # Coordenador Geral de Campanha
    # Coordenador de Marketing
    avail_list = (1, 7, 14)
    return id in avail_list
