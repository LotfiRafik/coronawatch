from django.db import models
from users.models import Agent, Moderator
#Create your models here.

class Countries(models.Model):
    name = models.CharField(max_length=255)
    code = models.CharField(max_length=10)

    # class Meta:
    #     managed = False
    #     db_table = 'countries'


class Regions(models.Model):
    region_name = models.CharField(max_length=255)
    code = models.CharField(max_length=10)
    country = models.ForeignKey(Countries, models.DO_NOTHING, related_name='regions')
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    riskagentid = models.ForeignKey(Agent, models.DO_NOTHING, blank=True, null=True)
    riskmoderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, blank=True, null=True)
    riskvalide = models.BooleanField(default=False)
    riskregion = models.BooleanField(default=False)

    # class Meta:
    #     managed = False
    #     db_table = 'regions'



class infectedRegions(models.Model):
    nb_death = models.IntegerField()
    nb_recovered = models.IntegerField()
    date = models.DateField(auto_now_add=True)
    regionid = models.ForeignKey(Regions, models.DO_NOTHING,  null=False, related_name='history')
    agentid = models.ForeignKey(Agent, models.DO_NOTHING, null=False)
    moderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, blank=True, null=True)
    valide = models.BooleanField(default=False)
    nb_notyetsick = models.IntegerField() 
    nb_suspected = models.IntegerField()
    nb_confirmed = models.IntegerField()


class receptionCenter(models.Model):
    name = models.CharField(max_length=255)
    adress = models.CharField(max_length=255)
    regionid = models.ForeignKey(Regions, models.DO_NOTHING, blank=True, null=True)


