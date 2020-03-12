from django.contrib import admin
from .models import Countries, Regions, infectedRegions, receptionCenter
# Register your models here.

admin.site.register(Countries)
admin.site.register(Regions)
admin.site.register(infectedRegions)
admin.site.register(receptionCenter)