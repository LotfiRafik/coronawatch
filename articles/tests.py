import json

from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from users.models import User
from django.test.client import encode_multipart
from rest_framework.authtoken.models import Token



from articles.models import Article,commentArticle
from users.models import Redactor,User
from articles.serializers import ArticleSerializer

#Create your tests here.
class NewArticleTestCase(APITestCase):
    def setUp(self):
        self.user1 = User(email="test@test333.com",user_type=3,username="red")
        self.user1.save()
        self.user2 = User(email="test@test.com",user_type=1,username="mod")
        self.user2.save()
        Article.objects.create(
            title='TestCase',
            content="Wearetestingamethodpost",
            date="2020-03-23",
            redactor=self.user1.redactor,
            moderatorid=self.user2.moderator,
            valide="False"
            )
        


    def testCreation(self):
        data={"title": "TestCase",
              "content": "Wearetestingamethodpost",
              }
        
        token = Token.objects.get(user=self.user1).key
        header = {}
        header['Authorization'] = "Token "+ str(token)
        response=self.client.post('/api/article/new/',data,format='json', HTTP_AUTHORIZATION=header['Authorization'])
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)


    def testArticleListGet(self):
         response=self.client.get('/api/article/')
         print(response)
         self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    
    def testArticleGetById(self):
        response=self.client.get('/api/article/detail/1/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)

class NewCommentArticleTestCase(APITestCase):
    def setUp(self):
        self.user1 = User(email="test@test333.com",user_type=3,username="red")
        self.user1.save()
        self.user2 = User(email="test@test.com",user_type=1,username="mod")
        self.user2.save()
        self.user3 = User(email="test@test3.com",user_type=4,username="mob")
        self.user3.save()
        self.article=Article(title='TestCase', content="Wearetestingamethodpost",date="2020-03-23", redactor=self.user1.redactor, moderatorid=self.user2.moderator,valide=True)
        self.article.save()
        commentArticle.objects.create(
            content="Wearetestingamethodpost",
            date="2020-03-23",
            mobileuserid=self.user3. mobileuser,
            articleid=self.article,
            )

    def testCommentArticleListGet(self):
         articleid = self.article.id
         response=self.client.get('/api/article/'+ str(articleid) + '/comments/')
         self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    def testCreation(self):
        data={
              "content": "Wearetestingamethodpost",
              }
        token = Token.objects.get(user=self.user3).key
        header = {}
        header['Authorization'] = "Token "+ str(token)
        response=self.client.post('/api/article/'+str(self.article.id)+'/newComment/',data,format='json', HTTP_AUTHORIZATION=header['Authorization'])
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)

    
   
        

    
    




        

        

   

