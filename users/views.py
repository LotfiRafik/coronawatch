from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import User
from .serializers import UserSerializer, EmailSignSerializer
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.hashers import make_password
from rest_framework.utils import json
from rest_framework.authtoken.models import Token
import requests
from .permissions import AdminOnly , IsNotAuthenticated, OwnerOnly
from rest_framework.permissions import IsAuthenticated


class GoogleSign(APIView):
    def post(self, request):
        payload = {'access_token': request.data.get("google_access_token")}  # validate the token
        r = requests.get('https://www.googleapis.com/oauth2/v2/userinfo', params=payload)
        data = json.loads(r.text)
        print(data)
        if 'error' in data:
            return Response(data, status=status.HTTP_401_UNAUTHORIZED)

        response = {}
        # create user if not exist
        try:
            user = User.objects.get(email=data['email'])
            response['token'] = Token.objects.get(user=user).key
        except User.DoesNotExist:
            # provider random default password
            user = {}
            user['password'] = make_password(BaseUserManager().make_random_password())
            user['email'] = data['email']
            #only mobile user can signin with google 
            user['user_type'] = 4
            user['username'] = data['email']
            serializer = UserSerializer(data=user)
            if serializer.is_valid():
                user = serializer.save()
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            #user.save()
            token = Token.objects.create(user=user)
            response['token'] = token.key

        return Response(response, status=status.HTTP_200_OK)



#only for non auth users
class EmailSign(APIView):
    permission_classes = [IsNotAuthenticated]

    def post(self, request):
        response = {}
        data = request.data.copy()
        data['user_type'] = 4
        serializer = EmailSignSerializer(data=data)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.get(user=user).key
            response['token'] = token
            return Response(response, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#permission to admin only
class AdminSign(APIView):
    permission_classes = [IsAuthenticated, AdminOnly]

    def post(self, request):
        response = {}
        serializer = EmailSignSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.get(user=user).key
            response['token'] = token
            return Response(response, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




class UsersList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated, AdminOnly]

    def get(self, request, format=None):
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    #def post(self, request, format=None):
    #    serializer = UserSerializer(data=request.data)
    #    if serializer.is_valid():
    #        serializer.save()
    #        return Response(serializer.data, status=status.HTTP_201_CREATED)
    #    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




class UserDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [IsAuthenticated, OwnerOnly]

    def get_object(self, pk):
        try:
            user = User.objects.get(pk=pk)
            self.check_object_permissions(self.request, user)
            return user
        except User.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    def patch(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        user = self.get_object(pk)
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



