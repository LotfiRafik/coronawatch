from rest_framework import serializers
from .models import PhotoAnalyze


class PhotoAnalyzeSerializer(serializers.ModelSerializer):
    #date = serializers.ReadOnlyField

    class Meta:
        model = PhotoAnalyze
        fields = ['id', 'photo', 'date', 'mobileuserid']

