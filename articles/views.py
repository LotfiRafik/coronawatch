from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Article,commentArticle
from .serializers import ArticleSerializer,CommentArtcileSerializer
from rest_framework.permissions import IsAuthenticated



class ArticleList(APIView):
    #permission_classes = [IsAuthenticated]
    def get(self,request):
        articles=Article.objects.all()
        serializer=ArticleSerializer(articles, many=True)
        return Response(serializer.data)
        
#only the redactor can create a new article
class NewArticle(APIView):
     def post(self,request):
        serializer=ArticleSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ArtcileDetail(APIView):
 
 def get_object(self, id):
  try:
   return Article.objects.get(id=id)
  except Article.DoesNotExist:
   return HttpResponse(status=status.HTTP_404_NOT_FOUND) 

 def get(self,request,id):
  article=self.get_object(id)
  serializer=ArticleSerializer(article)
  return Response(serializer.data) 
 
 def put(self,request,id):
  article=self.get_object(id)
  serializer=ArticleSerializer(article,data=request.data)
  if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
  return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

 def delete(self,request,id):
  article=self.get_object(id)
  article.delete()
  return Response(status=status.HTTP_204_NO_CONTENT)

class NewCommentArticle(APIView):  
    def post(self,request):
        serializer=CommentArtcileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CommentArticleList(APIView):
    def get(self,request):
        comment=commentArticle.objects.all()
        serializer=CommentArtcileSerializer(comment, many=True)
        return Response(serializer.data)

class CommentArticleDetail(APIView):
    def get_object(self, id):
      try:
        return commentArticle.objects.get(id=id)
      except commentArticle.DoesNotExist:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    def delete(self,request,id):
      comment=self.get_object(id)
      comment.delete()
      return Response(status=status.HTTP_204_NO_CONTENT)
    
    


