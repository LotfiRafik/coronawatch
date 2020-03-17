from django.contrib import admin
from .models import User, Admin, Moderator, Agent, Redactor, MobileUser
# Register your models here.


admin.site.register(User)
admin.site.register(Admin)
admin.site.register(Moderator)
admin.site.register(Agent)
admin.site.register(Redactor)
admin.site.register(MobileUser)