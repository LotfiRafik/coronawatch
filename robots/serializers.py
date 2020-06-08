from rest_framework import serializers
from .models import RobotsContent



class RobotContentSerializer(serializers.ModelSerializer):
    source_type = serializers.CharField(source='get_source_type_display')

    class Meta:
        model = RobotsContent
        fields = '__all__'

#json config file 
class YoutubeConfigSerializer(serializers.Serializer):
    ORDER_TYPE_CHOICES = ("date","rating","relevance","viewCount")
    q = serializers.ListField()
    maxResults = serializers.IntegerField(min_value=5, max_value=50)
    order = serializers.ChoiceField(choices=ORDER_TYPE_CHOICES)
