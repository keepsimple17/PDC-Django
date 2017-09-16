from django.db import models

# Create your models here.
class Conta(models.Model):

    nome = models.CharField('Nome', max_length=40)
    sobrenome = models.CharField('Sobrenome,', max_length=60)
    email = models.EmailField('Email', max_length=100)
    password = models.CharField('Senha', max_length=30)
    role = models.PositiveSmallIntegerField('Role')
    status = models.PositiveSmallIntegerField('Status')
    start_date = models.DateField(
        'Data de Início', null=True, blank=True
    )
    slug = models.SlugField('Atalho', blank=True)
    description = models.TextField('Descrição', blank=True)

    image = models.ImageField(
        upload_to='images', verbose_name='Imagem'
    )
