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
from django.core.files.uploadedfile import TemporaryUploadedFile, InMemoryUploadedFile
import shutil
import time
import sys



class ArticleList(APIView):
    def get(self,request):
        if request.user.is_authenticated and request.user.user_type == 1:
          #only the moderator who can see all articles 
          articles=Article.objects.all().order_by('-date')
        elif request.user.is_authenticated and request.user.user_type == 3:
          #redactor can see his articles
          articles=Article.objects.filter(redactor=request.user.redactor).order_by('-date')
        else:
          # the others see only the validated articles 
          articles = Article.objects.filter(valide=True).order_by('-date')

        serializer=ArticleSerializer(articles, many=True)
        return Response(serializer.data)
        


#only the redactor can create a new article
class NewArticle(APIView):
  permission_classes = [IsAuthenticated, RedactorOnly]

  def post(self,request):
    #We cant modify directly request.data so we copy it
    data = {}
    print(request.headers)
    sys.stdout.flush()
    print(request.data)
    sys.stdout.flush()
    data = request.data.copy()
    print(data)
    sys.stdout.flush()
    #Id of the redactor 
    data['redactor'] = request.user.redactor.id
    data['valide'] = False
    data['moderatorid'] = None
    serializer=ArticleSerializer(data=data)
    if not serializer.is_valid():
      print(serializer.errors)
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    #Save article in database
    article = serializer.save()
    #Upload attachments to the cloud
    if "attachments" in request.data:
      for f in request.FILES.getlist('attachments'):
        print(f)
        #if file is TemporaryUploadFile type , we pass the path 
        if isinstance(f, TemporaryUploadedFile):
          f = f.temporary_file_path()
        upload_file_cloudinary(f, article)
    return Response({'url':'https://coronawatch.herokuapp.com/api/article/detail/'+str(article.id)+'/'}, status=status.HTTP_201_CREATED)



#only the redactor can add attachments to his article
class attachmentArticleView(APIView):

  permission_classes = [IsAuthenticated, RedactorOnly, OwnerOnly]
  
  def get_object(self, id):
    try:
      article = Article.objects.get(id=id)
      self.check_object_permissions(self.request, article.redactor.user)
      return article
    except Article.DoesNotExist:
      raise Http404
    

  def post(self,request,id):
    #We cant modify directly request.data so we copy it
    data = {}
    print(request.headers)
    sys.stdout.flush()
    print(request.data)
    sys.stdout.flush()
    data = request.data.copy()
    print(data)
    sys.stdout.flush()
    article=self.get_object(id)
    #Upload attachments to the cloud
    if "attachments" in request.data:
      for f in request.FILES.getlist('attachments'):
        print(f)
        #if file is TemporaryUploadFile type , we pass the path 
        if isinstance(f, TemporaryUploadedFile):
          f = f.temporary_file_path()
        upload_file_cloudinary(f, article)
    return Response({'url':'https://coronawatch.herokuapp.com/api/article/detail/'+str(article.id)+'/'}, status=status.HTTP_201_CREATED)



#only the redactor can delete attachments from his article
class attachmentArticleDetail(APIView):

  permission_classes = [IsAuthenticated, RedactorOnly, OwnerOnly]
  
  def get_object(self, id):
    try:
      attachment = attachmentArticle.objects.get(id=id)
      self.check_object_permissions(self.request, attachment.articleid.redactor.user)
      return attachment
    except attachmentArticle.DoesNotExist:
      raise Http404
    
  def delete(self,request,id):
    attachment=self.get_object(id)
    attachment.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)


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
    permission_classes = [ArticleOwnerOrModerator]
    def get_object(self, id):
      try:
        article = Article.objects.get(id=id)
        #only the moderator or article owner can see non validated articles 
        if self.request.method != "GET" or article.valide == False:
          self.check_object_permissions(self.request, article.redactor.user)
        return article
      except Article.DoesNotExist:
        raise Http404


    def get(self,request,id):
      article=self.get_object(id)
      serializer=ArticleSerializer(article)
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
      article=self.get_object(id)
      #Only the owner of the article can edit it (Redactor)
      #When ever the redactor edit the article , the article will be non validated
      data['redactor'] = request.user.redactor.id
      data['valide'] = False
      data['moderatorid'] = None

      serializer = ArticleSerializer(article, data=data, partial=True)
      if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
    def delete(self,request,id):
       article=self.get_object(id)
       article.delete()
       return Response(status=status.HTTP_204_NO_CONTENT)


class NewCommentArticle(APIView):  
    permission_classes = [IsAuthenticated, MobileUserOnly]
    
    def get_object(self, id):
      try:
        article = Article.objects.get(id=id)
        #article non validated yet
        if article.valide == False:
          raise Http404
        else:
          return article
      except Article.DoesNotExist:
        raise Http404

    def post(self,request, id):

      article=self.get_object(id)
      if(article.valide):
        print(request.data)
        sys.stdout.flush()
        #We cant modify directly request.data so we copy it
        data = request.data.copy()
        print(data)
        sys.stdout.flush()
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
  permission_classes = [OwnerOrModerator]
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

    
    


