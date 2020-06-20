from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import thematicVideo,commentThematicVideo
from .serializers import  VideoSerializer, CommentVideoSerializer
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



class VideoList(APIView):

    #permission_classes = [MobileUserOrReadOnly]


    def get(self,request):
        if request.user.is_authenticated and request.user.user_type == 1:
          #only the moderator who can see all videos 
          videos = thematicVideo.objects.all().order_by('-date')
        else:
          # the others see only the validated videos 
          videos = thematicVideo.objects.filter(valide=True).order_by('-date')

        serializer = VideoSerializer(videos, many=True)
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

      return Response(data={"test header":"test header"},status=status.HTTP_400_BAD_REQUEST)
      if "video" in request.FILES:
        #Id of the redactor 
        data['mobileuserid'] = request.user.mobileuser.id
        data['valide'] = False
        data['moderatorid'] = None
        serializer = VideoSerializer(data=data)
        if not serializer.is_valid():
          print(serializer.errors)
          return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        #Save video in database
        video = serializer.save()
        #Upload attachments to the cloud
        f = request.FILES.get('video')
        print(f)
        #if file is TemporaryUploadFile type , we pass the path 
        if isinstance(f, TemporaryUploadedFile):
          f = f.temporary_file_path()
        upload_file_cloudinary(f, video)
        return Response({'url':'https://coronawatch.herokuapp.com/api/video/'+str(video.id)+'/'}, status=status.HTTP_201_CREATED)
      return Response(data={"video":"not provided"},status=status.HTTP_400_BAD_REQUEST)



#upload image or video to cloud
def upload_file_cloudinary(f,video):
  at_type = ""
  try:
    extension = str(f).split(".")[1].lower()
    if str(f).lower().endswith(('.mp4')):
      out = cloudinary.uploader.upload(f, resource_type = "video", folder="videohomepage")
      video.path = out['url']
      video.save()
  except cloudinary.exceptions.Error:
    print(cloudinary.exceptions.Error)
    return Response(cloudinary.exceptions.Error, status=status.HTTP_400_BAD_REQUEST)
  return 0



class ValidateVideo(APIView):
  #only the moderator has the right to validate a video 

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return thematicVideo.objects.get(id=id)
    except thematicVideo.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    video = self.get_object(id)
    data['valide'] = True
    data['moderatorid'] = request.user.moderator.id
    serializer = VideoSerializer(video, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class InvalidateVideo(APIView):
  #only the moderator has the right to invalidate a video

  permission_classes = [IsAuthenticated, ModeratorOnly]

  def get_object(self, id):
    try:
      return thematicVideo.objects.get(id=id)
    except thematicVideo.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    video = self.get_object(id)
    data['valide'] = False
    data['moderatorid'] = request.user.moderator.id
    serializer = VideoSerializer(video, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class VideoDetail(APIView):
    permission_classes = [VideoOwnerOrModerator]

    def get_object(self, id):
      try:
        video = thematicVideo.objects.get(id=id)
        #only the moderator or video owner can see non validated videos 
        if self.request.method != "GET" or video.valide == False:
          self.check_object_permissions(self.request, video.mobileuserid.user)
        return video
      except thematicVideo.DoesNotExist:
        raise Http404


    def get(self,request,id):
      video=self.get_object(id)
      serializer=VideoSerializer(video)
      return Response(serializer.data)


    def patch(self, request, id, format=None):
      print(request.headers)
      sys.stdout.flush()
      print(request.data)
      sys.stdout.flush()
      data = {}
      data = request.data.copy()
      print(data)
      sys.stdout.flush()
      video = self.get_object(id)
      #Only the owner of the video can edit it (Redactor)
      #When ever the mobile user edit the video , the video will be non validated
      data['mobileuserid'] = request.user.mobileuser.id
      data['valide'] = False
      data['moderatorid'] = None
      if 'path' in data:
        del data['path']
      serializer = VideoSerializer(video, data=data, partial=True)
      if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
    def delete(self,request,id):
       video=self.get_object(id)
       video.delete()
       return Response(status=status.HTTP_204_NO_CONTENT)



class CommentVideoList(APIView):
    
    permission_classes = [MobileUserOrReadOnly]

    #GET comments of video 5 for example
    def get_object(self, id):
      try:
        return thematicVideo.objects.get(id=id)
      except thematicVideo.DoesNotExist:
        raise Http404


    def get(self,request,id):
        video = self.get_object(id)
        serializer=CommentVideoSerializer(video.comments, many=True)
        return Response(serializer.data)
    
    def post(self,request, id):
        video=self.get_object(id)
        if(video.valide):
            print(request.data)
            sys.stdout.flush()
            #We cant modify directly request.data so we copy it
            data = request.data.copy()
            print(data)
            sys.stdout.flush()
            #Id of the mobileUser 
            data['mobileuserid'] = request.user.mobileuser.id
            data['thematicVideoid'] = id
            serializer=CommentVideoSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)




class CommentVideoDetail(APIView):

  #The owner of the comment only or moderator can delete the comment
  permission_classes = [OwnerOrModerator]

  def get_object(self, id):
    try:
      comment =  commentThematicVideo.objects.get(id=id)
      if self.request.method != "GET":
        self.check_object_permissions(self.request, comment.mobileuserid.user)
      return comment
    except commentThematicVideo.DoesNotExist:
      raise Http404
  
  def get(self,request,id):
    comment=self.get_object(id)
    serializer=CommentVideoSerializer(comment)
    return Response(serializer.data) 
  
  def delete(self,request,id):
    comment=self.get_object(id)
    comment.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

  def patch(self, request, id, format=None):
    data = {}
    comment=self.get_object(id)
    #User can edit only the content of the comment 
    data['content'] = request.data['content']
    serializer = CommentVideoSerializer(comment, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
    


