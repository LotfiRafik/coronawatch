from django.core.exceptions import PermissionDenied
from django.http import Http404, HttpResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view


from .models import RobotsContent
from .permissions import *
from .serializers import RobotContentSerializer,YoutubeConfigSerializer
import json
# Create your views here.

#config file youtube robot
prop_youtube_file = "robots/prop_youtube.json"


class RobotContentList(APIView):


    def get(self,request):
        filters = {}
        if "source" in request.GET:
            if request.GET["source"] == "facebook":
                filters["source_type"] = 0
            elif request.GET["source"] == "youtube":
                filters["source_type"] = 1
            elif request.GET["source"] == "web":
                filters["source_type"] = 2
        #only the moderator who can see all robot contents 
        if not (request.user.is_authenticated and request.user.user_type == 1):
            filters["valide"] = True

        robotscontent = RobotsContent.objects.filter(**filters).order_by('-date')
        serializer = RobotContentSerializer(robotscontent, many=True)
        return Response(serializer.data)

class RobotContentDetail(APIView):
    
    def get_object(self, id,request):
        try:
            robotcontent = RobotsContent.objects.get(id=id)
            #only the moderator  can see non validated content 
            if robotcontent.valide == False:
                if not (request.user.is_authenticated and request.user.user_type == 1):
                    raise PermissionDenied()
            else:
                return robotcontent
        except RobotsContent.DoesNotExist:
            raise Http404


    def get(self,request,id):
      robotcontent = self.get_object(id,request)
      serializer=RobotContentSerializer(robotcontent)
      return Response(serializer.data)



class ValidateRobotContent(APIView):
  #only the moderator has the right to validate a robot content 

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return RobotsContent.objects.get(id=id)
    except RobotsContent.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    robotcontent = self.get_object(id)
    data['valide'] = True
    data['moderatorid'] = request.user.moderator.id
    serializer = RobotContentSerializer(robotcontent, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class InvalidateRobotContent(APIView):
  #only the moderator has the right to invalidate a robot content 

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return RobotsContent.objects.get(id=id)
    except RobotsContent.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    robotcontent = self.get_object(id)
    data['valide'] = False
    data['moderatorid'] = request.user.moderator.id
    serializer = RobotContentSerializer(robotcontent, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




#Moderator get,set bunch of properties that our script will use to interrogate youtube api
class YoutubeConfig(APIView):
    permission_classes = [IsAuthenticated, ModeratorOnly]


    def get(self,request):
        with open(prop_youtube_file) as prop_file:
            return Response(json.load(prop_file))

    def post(self,request):
        #serializer to validate
        prop_json = {}
        
        serializer = YoutubeConfigSerializer(data=request.data)
        if serializer.is_valid():
            with open(prop_youtube_file, 'w', encoding='utf-8') as f:
                json.dump(serializer.data, f, ensure_ascii=False, indent=4)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)