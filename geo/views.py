import requests
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.hashers import make_password
from django.http import Http404, HttpResponseForbidden
from django.db.models import Max,F

from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.utils import json
from rest_framework.views import APIView

from .models import Countries, Regions, infectedRegions, receptionCenter
from .permissions import IsAgentOrReadOnly, AdminOnly, IsNotAuthenticated,ModeratorOnly, OwnerOnly, AgentOnly, AgentOnly_Object
from .serializers import HistoryInfectedRegionSerializer, CountrySerializer, RegionSerializer, infectedRegionSerializer, DetailCountrySerializer

import sys
import datetime
# Create your views here.



class CountryList(APIView):
    """
    List all countries,Create new country
    """
    permission_classes = [IsAgentOrReadOnly]

    def get(self, request, format=None):
        countries = Countries.objects.all()
        serializer = CountrySerializer(countries, many=True)
        return Response(serializer.data)

    def post(self,request):

        print(request.headers)
        sys.stdout.flush()
        print(request.data)
        sys.stdout.flush()
        serializer=CountrySerializer(data=request.data)
        if serializer.is_valid():
          serializer.save()
          return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


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
        print(request.headers)
        sys.stdout.flush()
        print(request.data)
        sys.stdout.flush()
        country = self.get_object(pk)
        serializer = DetailCountrySerializer(country)
        return Response(serializer.data)


class RegionList(APIView):
    """
    List all regions, OR create new regions
    """
    permission_classes = [IsAgentOrReadOnly]

    def get(self, request, format=None):
        regions = Regions.objects.all()
        serializer = RegionSerializer(regions, many=True)
        return Response(serializer.data)

    def post(self,request):
        print(request.headers)
        sys.stdout.flush()
        print(request.data)
        sys.stdout.flush()
        data = {}
        data = request.data.copy()
        if 'riskregion' in data and data['riskregion'] == 'True':
            data['riskagentid'] = request.user.agent.id
            data['riskregion'] = True
        data['riskmoderatorid'] = None
        data['riskvalide'] = False
        serializer=RegionSerializer(data=data)
        if serializer.is_valid():
          serializer.save()
          return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



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


class DeclareRegionRisk(APIView):
  #only the health agent has the right to declare a region as a risk agent 

  permission_classes = [IsAuthenticated, AgentOnly]
  def get_object(self, id):
    try:
      return Regions.objects.get(id=id)
    except Regions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    region = self.get_object(id)
    data['riskregion'] = True
    data['riskagentid'] = request.user.agent.id
    serializer = RegionSerializer(region, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class IndeclareRegionRisk(APIView):
  #only the health agent has the right to declare a region as a risk agent 

  permission_classes = [IsAuthenticated, AgentOnly]
  def get_object(self, id):
    try:
      return Regions.objects.get(id=id)
    except Regions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    region = self.get_object(id)
    data['riskregion'] = False
    data['riskagentid'] = request.user.agent.id
    serializer = RegionSerializer(region, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ValidateRegionRisk(APIView):
  #only the moderator has the right to validate 

  permission_classes = [IsAuthenticated, ModeratorOnly]
  def get_object(self, id):
    try:
      return Regions.objects.get(id=id)
    except Regions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    region = self.get_object(id)
    data['riskvalide'] = True
    data['riskmoderatorid'] = request.user.moderator.id
    serializer = RegionSerializer(region, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class InvalidateRegionRisk(APIView):
  #only the moderator has the right to validate 

  permission_classes = [IsAuthenticated, ModeratorOnly]
  def get_object(self, id):
    try:
      return Regions.objects.get(id=id)
    except Regions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    region = self.get_object(id)
    data['riskvalide'] = False
    data['riskmoderatorid'] = request.user.moderator.id
    serializer = RegionSerializer(region, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)






#only the agent can insert an infected region
class InfectedRegionList(APIView):
  permission_classes = [IsAgentOrReadOnly]
  
  def get(self, request, format=None):
      infectedregions = infectedRegions.objects.all().distinct('regionid').order_by('regionid','-date')
      serializer = infectedRegionSerializer(infectedregions, many=True)
      return Response(serializer.data)


  def post(self,request):
    print(request.headers)
    sys.stdout.flush()
    print(request.data)
    sys.stdout.flush()
    #We cant modify directly request.data so we copy it
    data = {}
    data = request.POST.copy()
    #Id of the authenticated agent 
    data['agentid'] = request.user.agent.id
    data['moderatorid'] = None
    data['valide'] = False
    serializer=infectedRegionSerializer(data=data)
    if not serializer.is_valid():
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    #verify if we inserted the region today into infected regions
    infectedregion = infectedRegions.objects.filter(regionid=data['regionid'],date=datetime.date.today()).first()
    if not infectedregion:
        #Save infected region in database
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    else:
        serializer = infectedRegionSerializer(infectedregion, data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        
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


class ValidateInfectedRegion(APIView):
  #only the moderator has the right to validate 

  permission_classes = [IsAuthenticated, ModeratorOnly]
  def get_object(self, id):
    try:
      return infectedRegions.objects.get(id=id)
    except infectedRegions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    infectedregion = self.get_object(id)
    data['valide'] = True
    data['moderatorid'] = request.user.moderator.id
    serializer = infectedRegionSerializer(infectedregion, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class InvalidateInfectedRegion(APIView):
  #only the moderator has the right to invalidate 

  permission_classes = [IsAuthenticated, ModeratorOnly]
  def get_object(self, id):
    try:
      return infectedRegions.objects.get(id=id)
    except infectedRegions.DoesNotExist:
      raise Http404

  def patch(self, request, id, format=None):
    data = {}
    infectedregion = self.get_object(id)
    data['valide'] = False
    data['moderatorid'] = request.user.moderator.id
    serializer = infectedRegionSerializer(infectedregion, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class InfectedRegionCountry(APIView):
  #GET infected regions of country 6 for example
  def get_object(self, id):
    try:
      return Countries.objects.get(id=id)
    except Countries.DoesNotExist:
      raise Http404

  def get(self,request,id):
    country = self.get_object(id)
    regions = Regions.objects.filter(country=country)
    infectedregions = infectedRegions.objects.filter(regionid__in=regions).distinct('regionid').order_by('regionid','-date')
    serializer = infectedRegionSerializer(infectedregions, many=True)
    return Response(serializer.data)
