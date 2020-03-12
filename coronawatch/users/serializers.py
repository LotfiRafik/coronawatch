from rest_framework import serializers
from .models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        #fields = ['id', 'email', 'username', 'user_type']
        fields = '__all__'