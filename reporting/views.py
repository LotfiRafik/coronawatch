from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Reports
from .serializers import  ReportSerializer
from rest_framework.permissions import IsAuthenticated
from .permissions import *
import os
import cloudinary
import cloudinary.uploader
import cloudinary.api
from django.http import Http404
from django.core.files.uploadedfile import TemporaryUploadedFile, InMemoryUploadedFile
import shutil
import time
import sys



class ReportList(APIView):

    permission_classes = [MobileUserOrReadOnly]


    def get(self,request):

        if request.user.is_authenticated and request.user.user_type == 1:
          #only the moderator who can see all reports 
          reports = Reports.objects.all().order_by('-date')
        elif request.user.is_authenticated and request.user.user_type == 4:
          # the mobile users see only there reports
          reports = Reports.objects.filter(mobileuserid=request.user.mobileuser).order_by('-date')
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        serializer = ReportSerializer(reports, many=True)
        return Response(serializer.data)


    def post(self,request):
      #We cant modify directly request.data so we copy it
      data = {}
      print(request.headers)
      sys.stdout.flush()
      print(request.data)
      sys.stdout.flush()
      data = request.POST.copy()
      print(data)
      sys.stdout.flush()
      if "attachment" in request.FILES:
        #Id of the redactor 
        data['mobileuserid'] = request.user.mobileuser.id
        data['valide'] = False
        data['moderatorid'] = None
        serializer = ReportSerializer(data=data)
        if not serializer.is_valid():
          print(serializer.errors)
          return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        #Save report in database
        report = serializer.save()
        #Upload attachments to the cloud
        f = request.FILES.get('attachment')
        print(f)
        #if file is TemporaryUploadFile type , we pass the path 
        if isinstance(f, TemporaryUploadedFile):
          f = f.temporary_file_path()
        upload_file_cloudinary(f, report)
        return Response({'url':'https://coronawatch.herokuapp.com/api/report/'+str(report.id)+'/'}, status=status.HTTP_201_CREATED)
      return Response(data={"attachment":"not provided"},status=status.HTTP_400_BAD_REQUEST)



#upload image or video to cloud
def upload_file_cloudinary(f,report):
  at_type = ""
  try:
    extension = str(f).split(".")[1].lower()
    if str(f).lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):
      at_type = "photo"
      out = cloudinary.uploader.upload(f, folder="reporting")
    elif str(f).lower().endswith(('.mp4')):
      at_type = "video"
      out = cloudinary.uploader.upload(f, resource_type = "video", folder="reporting")
    report.path = out['url']
    report.attachment_type = at_type
    report.save()
  except cloudinary.exceptions.Error:
    print(cloudinary.exceptions.Error)
    return Response(cloudinary.exceptions.Error, status=status.HTTP_400_BAD_REQUEST)
  return 0



class ReportDetail(APIView):
    permission_classes = [OwnerOrModerator]

    def get_object(self, id):
      try:
        report = Reports.objects.get(id=id)
        #only the moderator or report owner can see 
        self.check_object_permissions(self.request, report.mobileuserid.user)
        return report
      except Reports.DoesNotExist:
        raise Http404


    def get(self,request,id):
      report = self.get_object(id)
      serializer=ReportSerializer(report)
      return Response(serializer.data)




class ValidateReport(APIView):
  #only the moderator has the right to validate a report 

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return Reports.objects.get(id=id)
    except Reports.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    report = self.get_object(id)
    data['valide'] = True
    data['moderatorid'] = request.user.moderator.id
    serializer = ReportSerializer(report, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class InvalidateReport(APIView):
  #only the moderator has the right to invalidate a report

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return Reports.objects.get(id=id)
    except Reports.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    report = self.get_object(id)
    data['valide'] = False
    data['moderatorid'] = request.user.moderator.id
    serializer = ReportSerializer(report, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

