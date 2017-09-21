from django.db import models

# Create your models here.

class EventoManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(title__icontains=query)
        )


class Evento(models.Model):
    id_Candidato = models.IntegerField('IdCandidato')
    Id_User = models.IntegerField('IdUser')
    created_at = models.DateTimeField(
        'Data Evento', auto_created=True
    )
    updated_at = models.DateTimeField(
        'Atualizado em', auto_now_add=True
    )
    Importancia = models.PositiveSmallIntegerField('Nível Importância Evento')
    # TODO Criar tabela de Origem de Eventos
    origem = models.IntegerField('Origem Evento')
    title = models.CharField('Evento', max_length=30)
    slug = models.SlugField('atalho', blank=True)
    reference = models.CharField('end_reference', max_length=40, blank=True, null=True)
    mensagem = models.CharField('Mensagem Evento', max_length=60, blank=True, null=True)

    objects = EventoManager()

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Atividade"
        verbose_name_plural = "Eventos"
        ordering = ['Importancia']