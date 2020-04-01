import requests
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.hashers import make_password
from django.http import Http404, HttpResponseForbidden
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.utils import json
from rest_framework.views import APIView

from .models import Countries, Regions, infectedRegions, receptionCenter
from .permissions import IsAgentOrReadOnly, AdminOnly, IsNotAuthenticated, OwnerOnly, AgentOnly, AgentOnly_Object
from .serializers import HistoryInfectedRegionSerializer, CountrySerializer, RegionSerializer, infectedRegionSerializer, DetailCountrySerializer

import datetime
# Create your views here.



class CountryList(APIView):
    """
    List all countries
    """
    #permission_classes = [IsAuthenticated, AdminOnly]

    def get(self, request, format=None):
        countries = Countries.objects.all()
        print(countries)
        serializer = CountrySerializer(countries, many=True)
        return Response(serializer.data)


class CountryDetail(APIView):
    """
    Retrieve, update or delete a country instance.
    """
    permission_classes = [AgentOnly_Object]

    def get_object(self, pk):
        try:
            country = Countries.objects.get(pk=pk)
            #GET Country Detail Can Be Done By Everyone
            if self.request.method != "GET":
                self.check_object_permissions(self.request,country)
            return country
        except Countries.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        country = self.get_object(pk)
        serializer = DetailCountrySerializer(country)
        return Response(serializer.data)


class RegionList(APIView):
    """
    List all regions
    """
    #permission_classes = [IsAuthenticated, AdminOnly]

    def get(self, request, format=None):
        regions = Regions.objects.all()
        serializer = RegionSerializer(regions, many=True)
        return Response(serializer.data)


class RegionDetail(APIView):
    """
    Retrieve, update or delete a region instance.
    """
    permission_classes = [AgentOnly_Object]

    def get_object(self, pk):
        try:
            region = Regions.objects.get(pk=pk)
            #GET Region Detail Can Be Done By Everyone
            if self.request.method != "GET":
                self.check_object_permissions(self.request,region)
            return region
        except Regions.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        region = self.get_object(pk)
        serializer = RegionSerializer(region)
        return Response(serializer.data)




class infectedRegionHistory(APIView):
    """
    Retrieve history of an infected region 
    """

    def get_object(self, regionid):
        try:
            region = Regions.objects.get(id=regionid)
            return region
        except Regions.DoesNotExist:
            raise Http404

    def get(self, request, regionid, format=None):
        region = self.get_object(regionid)
        serializer = HistoryInfectedRegionSerializer(region)
        return Response(serializer.data)



#only the agent can insert an infected regio
class InfectedRegion(APIView):
  permission_classes = [IsAgentOrReadOnly]
  
  def get(self, request, format=None):
      infectedregions = infectedRegions.objects.all()
      serializer = infectedRegionSerializer(infectedregions, many=True)
      return Response(serializer.data)


  def post(self,request):
    #We cant modify directly request.data so we copy it
    data = {}
    data = request.POST.copy()
    #Id of the authenticated agent 
    data['agentid'] = request.user.agent.id
    data['moderatorid'] = None
    data['valide'] = False
    #verify if we inserted the region today into infected regions
    infecteregion = infectedRegions.objects.filter(regionid=data['regionid'],date=datetime.date.today()).first()
    print(infecteregion)
    if not infectedRegions:
        serializer=infectedRegionSerializer(data=data)
        if not serializer.is_valid():
            print(serializer.errors)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        #Save infected region in database
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    else:
        serializer = infectedRegionSerializer(infecteregion, data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        
