from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Article,commentArticle, attachmentArticle
from .serializers import ArticleSerializer,CommentArtcileSerializer
from rest_framework.permissions import IsAuthenticated
from .permissions import *
import os
import cloudinary
import cloudinary.uploader
import cloudinary.api
from django.http import Http404
import django_rq
from django.core.files.uploadedfile import TemporaryUploadedFile, InMemoryUploadedFile
import shutil
import time
import sys



class ArticleList(APIView):
    def get(self,request):
        if request.user.is_authenticated and request.user.user_type == 1:
          #only the moderator who can see all articles 
            articles=Article.objects.all()
        else:
          # the others see only the validated articles 
          articles = Article.objects.filter(valide=True)

        serializer=ArticleSerializer(articles, many=True)
        return Response(serializer.data)
        


#only the redactor can create a new article
class NewArticle(APIView):
  permission_classes = [IsAuthenticated, RedactorOnly]

  def post(self,request):
    #We cant modify directly request.data so we copy it
    data = {}
    data = request.POST.copy()
    #Id of the redactor 
    data['redactor'] = request.user.redactor.id
    data['valide'] = False
    serializer=ArticleSerializer(data=data)
    if not serializer.is_valid():
      print(serializer.errors)
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    #Save article in database
    article = serializer.save()
    #Upload attachments to the cloud
    for f in request.FILES.getlist('attachments'):
      #if file is TemporaryUploadFile type , we pass the path 
      if isinstance(f, TemporaryUploadedFile):
        print ("is instance of Temprary Uploaded File")
        sys.stdout.flush()
        f = f.temporary_file_path()
        #Create temp folder to store the file before script end and the file get deleted
        if not os.path.exists('tmp/'):
          print ("tmp/ doesnt exist")
          sys.stdout.flush()
          os.makedirs('tmp/')
        shutil.copyfile(f, f[1:])
        f = f[1:]
        os.listdir("tmp/")
        if os.path.isfile(f):
          print("file exist on system")
      django_rq.enqueue(upload_file_cloudinary, f, article)
    return Response({'url':'https://coronawatch.herokuapp.com/api/article/detail/'+str(article.id)+'/'}, status=status.HTTP_201_CREATED)



#upload image or video to cloud
#update database (attachement_table)
def upload_file_cloudinary(f,article):
   at_type = ""
   try:
     extension = str(f).split(".")[1].lower()
     if str(f).lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):
       at_type = "photo"
       out = cloudinary.uploader.upload(f, folder="articles")
       attachmentArticle.objects.create(attachment_type=at_type, path=out['url'],articleid=article)
     elif str(f).lower().endswith(('.mp4')):
       at_type = "video"
       out = cloudinary.uploader.upload(f, resource_type = "video", folder="articles")
       attachmentArticle.objects.create(attachment_type=at_type, path=out['url'],articleid=article)
       #Remove file from tmp folder 
       if os.path.exists(f):
         os.remove(f)
   except cloudinary.exceptions.Error:
     print(cloudinary.exceptions.Error)
     return Response(cloudinary.exceptions.Error, status=status.HTTP_400_BAD_REQUEST)
   return 0



class ValidateArticle(APIView):
  #only the moderator has the right to validate an article 

  permission_classes = [IsAuthenticated, ModeratorOnly]
  def get_object(self, id):
    try:
      return Article.objects.get(id=id)
    except Article.DoesNotExist:
      raise Http404


  def patch(self, request, id, format=None):
    data = {}
    article = self.get_object(id)
    data['valide'] = True
    data['moderatorid'] = request.user.moderator.id
    serializer = ArticleSerializer(article, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class ArtcileDetail(APIView):
  
    def get_object(self, id):
      try:
        return Article.objects.get(id=id)
      except Article.DoesNotExist:
        raise Http404


    def get(self,request,id):
      article=self.get_object(id)
      serializer=ArticleSerializer(article)
      return Response(serializer.data) 
    
    # def delete(self,request,id):
    #   article=self.get_object(id)
    #   article.delete()
    #   return Response(status=status.HTTP_204_NO_CONTENT)


class NewCommentArticle(APIView):  
    permission_classes = [IsAuthenticated, MobileUserOnly]

    def get_object(self, id):
      try:
        return Article.objects.get(id=id)
      except Article.DoesNotExist:
        raise Http404


    def post(self,request, id):
      article=self.get_object(id)
      if(article.valide):
        #We cant modify directly request.data so we copy it
        data = request.data.copy()
        #Id of the mobileUser 
        data['mobileuserid'] = request.user.mobileuser.id
        data['articleid'] = id
        serializer=CommentArtcileSerializer(data=data)
        if serializer.is_valid():
          serializer.save()
          return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
      else:
        return Response(status=status.HTTP_400_BAD_REQUEST)



class CommentArticleList(APIView):
    #GET comments of article 5 for example
    def get_object(self, id):
      try:
        return Article.objects.get(id=id)
      except Article.DoesNotExist:
        raise Http404


    def get(self,request,id):
        article=self.get_object(id)
        serializer=CommentArtcileSerializer(article.comments, many=True)
        return Response(serializer.data)



class CommentArticleDetail(APIView):
  #The owner of the comment only or moderator can delete the comment
  permission_classes = [IsAuthenticated, OwnerOrModerator]
  def get_object(self, id):
    try:
      comment =  commentArticle.objects.get(id=id)
      if self.request.method != "GET":
        self.check_object_permissions(self.request, comment.mobileuserid.user)
      return comment
    except commentArticle.DoesNotExist:
      raise Http404
  
  def get(self,request,id):
    comment=self.get_object(id)
    serializer=CommentArtcileSerializer(comment)
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
    serializer = CommentArtcileSerializer(comment, data=data, partial=True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
    


