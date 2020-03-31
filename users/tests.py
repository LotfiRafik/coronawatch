import json
from unittest.mock import Mock, patch

from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase

from .models import *
from .serializers import *
from .views import GoogleSign

        #self.client.credentials(HTTP_AUTHORIZATION="Token " + response.data['token'])


class GoogleSignTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.globuser = User(email="test@test.test",user_type=3,username="test")
        cls.globuser.set_password("test")
        cls.globuser.save()
        cls.token_globuser = Token.objects.get(user=cls.globuser).key


    @patch('users.views.GoogleSign.auth2_google')
    def test_post_valide_google_token_new_user(self, mock_auth2_google):
        mock_auth2_google.return_value = {'email':'gl_bouchafa@esi.dz'}

        response = self.client.post("/api/users/googlesign/")
        #test if the user is created
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that response has the token of the user
        self.assertIn('token',response.data)
        #test that the password of the user is set to his token
        self.assertTrue(self.client.login(username='gl_bouchafa@esi.dz', password=response.data['token']))
    

    @patch('users.views.GoogleSign.auth2_google')
    def test_post_valide_google_token_user_exist(self, mock_auth2_google):
        mock_auth2_google.return_value = {'email':self.globuser.email}

        response = self.client.post("/api/users/googlesign/")
        #test if the user is retrieved
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the token of the user
        self.assertIn('token',response.data)
        #test that token response equal the token of the user
        self.assertEqual(self.token_globuser, response.data['token'])


#only for non auth users
class EmailSignTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.globuser = User(email="test@test.test",user_type=3,username="test")
        cls.globuser.set_password("test")
        cls.globuser.save()
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        

    def test_post_new_user(self):
        data = {'email':'gl_bouchafa@esi.dz','username':'rafix','password':'ana','password2':'ana'}
        response = self.client.post("/api/users/emailsign/", data=data)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that response has the token of the user
        self.assertIn('token',response.data)
        #test the user created is a mobile user
        user = User.objects.get(email='gl_bouchafa@esi.dz')
        self.assertEqual(4, user.user_type)

        
    def test_post_user_exist(self):
        data = {'email':'test@test.test','username':'test','password':'ana','password2':'ana'}
        response = self.client.post("/api/users/emailsign/", data=data)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)


# #permission to admin only
class AdminSignTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.globuser = User.objects.create(email="admin@admin.admin",user_type=0,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.nonadmin = User.objects.create(email="nonadmin@nonadmin.nonadmin",user_type=1,username="non")
        cls.token_nonadmin = Token.objects.get(user=cls.nonadmin).key
        cls.Authorization = "Token "+ str(cls.token_globuser)          

    def test_post_new_user(self):
        data = {'email':'gl_bouchafa@esi.dz','username':'rafix','password':'ana','password2':'ana','user_type':1}
        response = self.client.post("/api/users/adminsign/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that response has the token of the user
        self.assertIn('token',response.data)

        
    def test_post_user_exist(self):
        self.client.credentials(HTTP_AUTHORIZATION="Token " + str(self.token_globuser))
        data = {'email':'nonadmin@nonadmin.nonadmin','username':'test','password':'ana','password2':'ana','user_type':1}
        response = self.client.post("/api/users/adminsign/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)


    #test non auth users
    def test_post_user_without_credentials(self):
        data = {'email':'test@test.test','username':'cred','password':'ana','password2':'ana','user_type':1}
        response = self.client.post("/api/users/adminsign/", data=data)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    #test non admin users
    def test_post_user_with_nonadmin_credentials(self):
        data = {'email':'test@test.test','username':'no','password':'ana','password2':'ana','user_type':1}
        response = self.client.post("/api/users/adminsign/", data=data, HTTP_AUTHORIZATION="Token "+ str(self.token_nonadmin))
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)



class UsersListTestCase(APITestCase):


    def test_get(self):
        response=self.client.get('/api/users/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)


class UserDetailTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.globuser = User.objects.create(email="admin@admin.admin",user_type=0,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.nonadmin = User.objects.create(email="nonadmin@nonadmin.nonadmin",user_type=1,username="non")
        cls.token_nonadmin = Token.objects.get(user=cls.nonadmin).key
        cls.Authorization = "Token "+ str(cls.token_globuser)          


    
    def test_get(self):
        response=self.client.get('/api/users/'+str(self.globuser.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)

