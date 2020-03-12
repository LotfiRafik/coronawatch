from django.db import models
from users.models import MobileUser, Moderator
# Create your models here.
class Reports(models.Model):
    ATTACHMENT_TYPE_CHOICES = (
        (0, 'photo'),
        (1, 'video'),
    )
    attachment_type = models.PositiveSmallIntegerField(choices=ATTACHMENT_TYPE_CHOICES)
    path = models.CharField(max_length=255)
    mobileuserid = models.ForeignKey(MobileUser, related_name='reports', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, blank=True, null=True)
    valide = models.BooleanField()

