from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    email = models.EmailField(unique=True,null=False,blank=False)
    USER_TYPE_CHOICES = (
        (0, 'admin'),
        (1, 'moderator'),
        (2, 'agent'),
        (3, 'redactor'),
        (4, 'mobileuser'),
    )
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['user_type', 'username']



class Admin(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Moderator(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Agent(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Redactor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class MobileUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

