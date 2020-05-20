from rest_framework import serializers
from .models import thematicVideo, commentThematicVideo

class CommentVideoSerializer(serializers.ModelSerializer):
    class Meta:
        model=commentThematicVideo
        fields='__all__'


class VideoSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = thematicVideo
        fields = '__all__'


