from rest_framework import serializers
from .models import User, Admin, Moderator, Agent, Redactor, MobileUser


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email', 'username', 'user_type', 'profile_id', 'first_name', 'last_name']


class EmailSignSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type':'password'}, write_only=True)
    class Meta:
        model = User
        fields = ['email', 'username', 'password', 'password2', 'user_type']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def save(self):
        user = User(email=self.validated_data['email'],username=self.validated_data['username'],user_type=self.validated_data['user_type'])
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password != password2:
            raise serializers.ValidationError({'password':'Passwords must match.'})
        user.set_password(password)
        user.save()
        return user