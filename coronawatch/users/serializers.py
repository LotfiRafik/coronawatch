from rest_framework import serializers
from .models import User, Admin, Moderator, Agent, Redactor, MobileUser


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        #fields = ['id', 'email', 'username', 'user_type']
        fields = '__all__'

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        if(validated_data['user_type'] == 0):
            admin = Admin(user=user)
            admin.save()
        if(validated_data['user_type'] == 1):
            moderator = Moderator(user=user)
            moderator.save()
        if(validated_data['user_type'] == 2):
            agent = Agent(user=user)
            agent.save()
        if(validated_data['user_type'] == 3):
            redactor = Redactor(user=user)
            redactor.save()
        if(validated_data['user_type'] == 4):
            mobileuser = MobileUser(user=user)
            mobileuser.save()
        return user    