import requests
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.hashers import make_password
from django.http import Http404, HttpResponseForbidden
from rest_framework import parsers, renderers, status
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework.compat import coreapi, coreschema
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.schemas import ManualSchema
from rest_framework.utils import json
from rest_framework.views import APIView
import sys
from .models import *
from .permissions import AdminOnly, IsNotAuthenticated, OwnerOnly
from .serializers import EmailSignSerializer, UserSerializer


class GoogleSign(APIView):

    def auth2_google(self, request):

        payload = {'access_token': request.data.get("google_access_token")}  # validate the token
        r = requests.get('https://www.googleapis.com/oauth2/v2/userinfo', params=payload)
        data = json.loads(r.text)
        print(data)
        if 'error' in data:
            raise HttpResponseForbidden
        return data
        
    def post(self, request):

        data = self.auth2_google(request)
        response = {}
        # create user if not exist
        try:
            user = User.objects.get(email=data['email'])
            response['token'] = Token.objects.get(user=user).key
            return Response(response, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            # provider random default password
            user = {}
            user['email'] = data['email']
            #only mobile user can signin with google 
            user['user_type'] = 4
            user['username'] = data['email']
            serializer = UserSerializer(data=user)
            if serializer.is_valid():
                user = serializer.save()
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            #Token has been created auto after saving user
            token = Token.objects.get(user=user).key
            user.set_password(token)
            user.save()
            user = UserSerializer(user)
            response = user.data.copy()
            response.update({'token': token})
            return Response(response, status=status.HTTP_201_CREATED)

        



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
            user = UserSerializer(user)
            response = user.data.copy()
            response.update({'token': token})
            return Response(response, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#permission to admin only
class AdminSign(APIView):

    permission_classes = [IsAuthenticated, AdminOnly]

    def post(self, request):
        print(request.headers)
        sys.stdout.flush()
        response = {}
        serializer = EmailSignSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.get(user=user).key
            user = UserSerializer(user)
            response = user.data.copy()
            response.update({'token': token})
            return Response(response, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




class UsersList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

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
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = User.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user)
            return user
        except User.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)

    # def put(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserSerializer(user, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    # def patch(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserSerializer(user, data=request.data, partial=True)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # def delete(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     user.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)



class WebUsersList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        admins = User.objects.filter(user_type__range=(0,3))
        serializer = UserSerializer(admins, many=True)
        return Response(serializer.data)



class AdminList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        admins = User.objects.filter(user_type=0)
        serializer = UserSerializer(admins, many=True)
        return Response(serializer.data)


class AdminDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = Admin.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user.user)
            return user
        except Admin.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user.user)
        #PLUS PROFILE INFORMATION ... 
        return Response(serializer.data)



class ModeratorList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        moderators = User.objects.filter(user_type=1)
        serializer = UserSerializer(moderators, many=True)
        return Response(serializer.data)




class ModeratorDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = Moderator.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user.user)
            return user
        except Moderator.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user.user)
        return Response(serializer.data)


class AgentList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        agents = User.objects.filter(user_type=2)
        serializer = UserSerializer(agents, many=True)
        return Response(serializer.data)



class AgentDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = Agent.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user.user)
            return user
        except Agent.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user.user)
        return Response(serializer.data)


class RedactorList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        redactors = User.objects.filter(user_type=3)
        serializer = UserSerializer(redactors, many=True)
        return Response(serializer.data)



class RedactorDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = Redactor.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user.user)
            return user
        except Redactor.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user.user)
        return Response(serializer.data)


class MobileUserList(APIView):
    """
    List all users, or create a new user.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        mobiles = User.objects.filter(user_type=4)
        serializer = UserSerializer(mobiles, many=True)
        return Response(serializer.data)


class MobileDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    permission_classes = [OwnerOnly]

    def get_object(self, pk):
        try:
            user = MobileUser.objects.get(pk=pk)
            #GET USER DETAIL CAN BE DONE BY EVERYONE
            if self.request.method != "GET":
                self.check_object_permissions(self.request, user.user)
            return user
        except MobileUser.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user.user)
        return Response(serializer.data)





class ObtainAuthToken(APIView):
    throttle_classes = ()
    permission_classes = ()
    parser_classes = (parsers.FormParser, parsers.MultiPartParser, parsers.JSONParser,)
    renderer_classes = (renderers.JSONRenderer,)
    serializer_class = AuthTokenSerializer
    if coreapi is not None and coreschema is not None:
        schema = ManualSchema(
            fields=[
                coreapi.Field(
                    name="username",
                    required=True,
                    location='form',
                    schema=coreschema.String(
                        title="Username",
                        description="Valid username for authentication",
                    ),
                ),
                coreapi.Field(
                    name="password",
                    required=True,
                    location='form',
                    schema=coreschema.String(
                        title="Password",
                        description="Valid password for authentication",
                    ),
                ),
            ],
            encoding="application/json",
        )

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        serializer = UserSerializer(user)
        token, created = Token.objects.get_or_create(user=user)
        data = serializer.data.copy()
        data.update({'token': token.key})
        return Response(data)




class OwnerDetail(APIView):
    """
    Retrieve a user owner instance.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        serializer = UserSerializer(request.user)
        return Response(serializer.data)
