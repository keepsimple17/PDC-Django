# -*- coding: utf-8 -*-
from django.http import HttpResponse
import urllib.request
import re
from xml.dom import minidom


def cep(numero):
    url = 'http://cep.republicavirtual.com.br/web_cep.php?formato=' \
            'xml&cep=%s' % str(numero)
    dom = minidom.parse(urllib.request.urlopen(url))

    tags_name = ('uf',
                 'cidade',
                 'bairro',
                 'tipo_logradouro',
                 'logradouro',
                 )

    resultado = dom.getElementsByTagName('resultado')[0]
    resultado = int(resultado.childNodes[0].data)
    if resultado != 0:
        return _getDados(tags_name, dom)
    else:
        return {}


def _getDados(tags_name, dom):
    dados = {}

    for tag_name in tags_name:
        try:
            dados[tag_name] = dom.getElementsByTagName(tag_name)[0]
            dados[tag_name] = dados[tag_name].childNodes[0].data
        except:
            dados[tag_name] = ''

    return dados


# Podem ser usados outros webservices como o http://ceplivre.pc2consultoria.com/index.php?module=cep&cep=%s&formato=xml
# Entretanto deve ser observado o encoding para que ele seja alterado na linha 14
# Outra referencia util http://allissonazevedo.com/2012/03/22/buscando-cep-diretamente-pelo-site-dos-correios-em-python/
def addressGet(request, zipcode):
    # Trata o zipcode removendo caracteres diferentes de numeros.
    # Assim não precisamos nos preocupar de como vai vir o cep.
    zipcode = re.sub('[^\d]+', '', zipcode)
    results = cep(zipcode)
    print(results)
    try:
        return HttpResponse('{"street":"%s","district":"%s","city":"%s","state":"%s"}' % (
            results['logradouro'], results['bairro'], results['cidade'], results['uf']))
    except:
        return HttpResponse('{"message":"error"}')
