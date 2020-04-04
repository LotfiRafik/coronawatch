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
        self.article = Article.objects.create(
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
        response=self.client.post('/api/article/new/', data, HTTP_AUTHORIZATION=header['Authorization'])
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)


    def testArticleListGet(self):
         response=self.client.get('/api/article/')
         print(response)
         self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    
    def testArticleGetById(self):
        token = Token.objects.get(user=self.user2).key
        header = {}
        header['Authorization'] = "Token "+ str(token)
        response=self.client.get('/api/article/detail/'+str(self.article.id)+'/', HTTP_AUTHORIZATION=header['Authorization'])
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

    
   
        

class ArticleDetailTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.redactor = User.objects.create(email="redactor@esi.dz",user_type=3,username="red")
        cls.token_redactor = Token.objects.get(user=cls.redactor).key
        cls.wredactor = User.objects.create(email="wredactor@esi.dz",user_type=3,username="wred")
        cls.token_wredactor = Token.objects.get(user=cls.wredactor).key
        cls.moderator = User.objects.create(email="moderator@esi.dz",user_type=1,username="mod")
        cls.token_moderator = Token.objects.get(user=cls.moderator).key
        cls.Authorization = "Token "+ str(cls.token_redactor)     
        cls.mobile = User.objects.create(email="mobile@esi.dz",user_type=1,username="mob")
        cls.token_mobile = Token.objects.get(user=cls.mobile).key


    def setUp(self):
        self.article = Article.objects.create(
            title='TestCase',
            content="Wearetestingamethodpost",
            redactor=self.redactor.redactor,
            valide=True,
            moderatorid=self.moderator.moderator
            )
            
             

    
    def test_patch(self):
        data = {'title':'test_patch_title','content':'test_patch_content'}
        response = self.client.patch('/api/article/detail/'+str(self.article.id)+'/', data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the title and content has changed
        self.assertEqual("test_patch_title", response.data['title'])
        self.assertEqual("test_patch_content", response.data['content'])
        #test that the article became invalid after edit
        self.assertFalse(response.data['valide'])
        #test that the article moderator id became null
        self.assertIsNone(response.data['moderatorid'])

    def test_patch_without_credentials(self):
        data = {'title':'test_patch_title','content':'test_patch_content'}
        response = self.client.patch('/api/article/detail/'+str(self.article.id)+'/', data=data)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    def test_patch_wrong_redactor(self):
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_wredactor))
        data = {'title':'test_patch_title','content':'test_patch_content'}
        response = self.client.patch('/api/article/detail/'+str(self.article.id)+'/', data=data)
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)

    def test_patch_moderator_credentials(self):
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_moderator))
        data = {'title':'test_patch_title','content':'test_patch_content'}
        response = self.client.patch('/api/article/detail/'+str(self.article.id)+'/', data=data)
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)

    def test_patch_change_valide_boolean(self):
        self.article.valide = False
        self.article.save()
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_redactor))
        data = {'valide':True}
        response = self.client.patch('/api/article/detail/'+str(self.article.id)+'/', data=data)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the article still invalide
        self.assertFalse(response.data['valide'])

   

   
    def test_delete(self):
        response = self.client.delete('/api/article/detail/'+str(self.article.id)+'/', HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)

    def test_delete_without_credentials(self):
        response = self.client.delete('/api/article/detail/'+str(self.article.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    def test_delete_wrong_redactor(self):
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_wredactor))
        response = self.client.delete('/api/article/detail/'+str(self.article.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)

    def test_delete_moderator_credentials(self):
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_moderator))
        response = self.client.delete('/api/article/detail/'+str(self.article.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)


