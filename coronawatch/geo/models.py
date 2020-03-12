from django.db import models
from users.models import Agent, Moderator
# Create your models here.

class Countries(models.Model):
    name = models.CharField(max_length=255)
    code = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'countries'


class Regions(models.Model):
    region_name = models.CharField(max_length=255)
    code = models.CharField(max_length=10)
    country = models.ForeignKey(Countries, models.DO_NOTHING)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    riskagentid = models.ForeignKey(Agent, models.DO_NOTHING, db_column='riskagentid', blank=True, null=True)
    riskmoderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, db_column='riskmoderatorid', blank=True, null=True)
    riskvalide = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'regions'



class infectedRegion(models.Model):
    
