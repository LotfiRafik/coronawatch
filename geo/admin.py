from django.contrib import admin
from .models import Countries, Regions, infectedRegions, receptionCenter

admin.site.register(Countries)
admin.site.register(Regions)
admin.site.register(infectedRegions)
admin.site.register(receptionCenter)