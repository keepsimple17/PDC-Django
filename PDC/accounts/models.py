from django.db import models

# Create your models here.

class ContaManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(nome__icontains=query) | models.Q(email__icontains=query)


class EquipeManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(nome__icontains=query) | models.Q(emailEquipe__icontains=query)
        )


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
        upload_to='images', verbose_name='Imagem', null=True, blank=True
    )

    created_at = models.DateTimeField(
        'Criado em', auto_now_add=True
    )

    updated_at = models.DateTimeField('Atualizado em', auto_now_add=True)

    objects = ContaManager()

    def __str__(self):
        return self.nome



class Equipe(models.Model):
    Id_MembroEquipe = models.IntegerField('IdMembroEquipe')
    Id_Candidato = models.IntegerField('IdCandidato')
    Id_User = models.IntegerField('IdUser')
    CPF = models.CharField('CPF', max_length=16)
    nome = models.CharField('Nome', max_length=100)
    sexo = models.CharField('Sexo', max_length=1)
    DataNascimento = models.DateField(
        'Data Nascimento', null=True, blank=True
    )
    foto = models.ImageField(
        upload_to='images/FotosEquipe', verbose_name='fotoEquipe', null=True, blank=True
    )
    emailEquipe = models.EmailField('email', max_length=100)
    CEP = models.CharField('CEP', max_length=10,null=True, blank=True)
    Endereco = models.CharField('Endereço', max_length=200,null=True, blank=True)
    Cidade = models.CharField('Cidade', max_length=60,null=True, blank=True)
    UF = models.CharField('UF', max_length=2,null=True, blank=True)
    Telefone = models.CharField('Telefone', max_length=12,null=True, blank=True)
    Celular = models.CharField('Celular', max_length=12, blank=True)
    slug = models.SlugField('Atalho', blank=True)
    Obs = models.TextField('Observação', blank=True, null=True)
    NivelAcessoMembro = models.IntegerField('Nivel de Acesso', max_length=11)
    created_at = models.DateTimeField(
        'Data de Entrada', auto_created=True
    )
    updated_at = models.DateTimeField(
        'Atualizado em', auto_now_add=True
    )
    AcessoGestCamp = models.PositiveSmallIntegerField('Acesso Gestao Campanha',max_length=4)
    AcessoGestFin = models.PositiveSmallIntegerField('Acesso Gestao Financeira', max_length=4)
    AcessoGestGab = models.PositiveSmallIntegerField('Acesso Gestao Gabinete', max_length=4)
    Role = models.CharField('Função', max_length=60)

    objects = EquipeManager()

    def __str__(self):
        return self.nome