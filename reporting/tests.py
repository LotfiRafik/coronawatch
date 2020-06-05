import json

from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from users.models import User
from django.test.client import encode_multipart
from rest_framework.authtoken.models import Token
import datetime



from reporting.models import Reports
from users.models import Redactor,User
from reporting.serializers import ReportSerializer
# Create your tests here.


class ReportListTestCase(APITestCase):

    #MobileUser Or Read Only

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.user1 = User(email="test@test333.com",user_type=4,username="red")
        cls.user1.save()
        cls.user2 = User(email="test@test.com",user_type=1,username="mod")
        cls.user2.save()
        cls.report = Reports.objects.create(
            symptoms='TestCase',
            address="Wearetestingamethodpost",
            mobileuserid=cls.user1.mobileuser,
            )
        cls.globuser = User.objects.create(email="mod@mod.mod",user_type=1,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.Authorization = "Token "+ str(cls.token_globuser)   
    
    #Get reports by moderator
    def test_get_moderator(self):
        
        response=self.client.get('/api/report/', HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('symptoms',response.data[0])
        self.assertIn('address',response.data[0])
        self.assertIn('date',response.data[0])
        self.assertIn('mobileuserid',response.data[0])
        self.assertEqual(response.data[0]['symptoms'],self.report.symptoms)
        self.assertEqual(response.data[0]['address'],self.report.address)
        self.assertEqual(response.data[0]['date'],str(datetime.date.today()))
        self.assertEqual(response.data[0]['mobileuserid'],self.user1.mobileuser.id)

    #TODO
    #def test_post_with_attachment(self):

    
    def test_post_without_attachment(self):

        data = {'symptoms':'TestCase','address':'Wearetestingamethodpost'}
        token = Token.objects.get(user=self.user1).key
        header = {}
        header['Authorization'] = "Token "+ str(token)
        response=self.client.post('/api/report/', data, HTTP_AUTHORIZATION=header['Authorization'])
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)



class ReportDetailTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.user1 = User(email="test@test333.com",user_type=4,username="mobile")
        cls.user1.save()
        cls.token_user1 = Token.objects.get(user=cls.user1).key
        cls.AuthorizationMobile = "Token "+ str(cls.token_user1)       


        cls.user2 = User(email="test@test.com",user_type=2,username="red")
        cls.user2.save()
        cls.report = Reports.objects.create(
            symptoms='TestCase',
            address="Wearetestingamethodpost",
            mobileuserid=cls.user1.mobileuser,
            )
        cls.globuser = User.objects.create(email="mod@mod.mod",user_type=1,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.AuthorizationModerator = "Token "+ str(cls.token_globuser)       

    def test_get_by_owner(self):
        response=self.client.get('/api/report/'+str(self.report.id)+'/', HTTP_AUTHORIZATION=self.AuthorizationMobile)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('symptoms',response.data)
        self.assertIn('address',response.data)
        self.assertIn('date',response.data)
        self.assertIn('mobileuserid',response.data)
        self.assertEqual(response.data['symptoms'],self.report.symptoms)
        self.assertEqual(response.data['address'],self.report.address)
        self.assertEqual(response.data['date'],str(datetime.date.today()))
        self.assertEqual(response.data['mobileuserid'],self.user1.mobileuser.id)

    def test_get_by_moderator(self):
        response=self.client.get('/api/report/'+str(self.report.id)+'/', HTTP_AUTHORIZATION=self.AuthorizationModerator)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('symptoms',response.data)
        self.assertIn('address',response.data)
        self.assertIn('date',response.data)
        self.assertIn('mobileuserid',response.data)
        self.assertEqual(response.data['symptoms'],self.report.symptoms)
        self.assertEqual(response.data['address'],self.report.address)
        self.assertEqual(response.data['date'],str(datetime.date.today()))
        self.assertEqual(response.data['mobileuserid'],self.user1.mobileuser.id)


class ValidateReportTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.user1 = User(email="test@test333.com",user_type=4,username="mobile")
        cls.user1.save()
        cls.token_user1 = Token.objects.get(user=cls.user1).key
        cls.AuthorizationMobile = "Token "+ str(cls.token_user1)       


        cls.user2 = User(email="test@test.com",user_type=2,username="red")
        cls.user2.save()
        cls.report = Reports.objects.create(
            symptoms='TestCase',
            address="Wearetestingamethodpost",
            mobileuserid=cls.user1.mobileuser,
            )
        cls.globuser = User.objects.create(email="mod@mod.mod",user_type=1,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.AuthorizationModerator = "Token "+ str(cls.token_globuser) 

    def test_patch_by_moderator(self):
        response = self.client.patch('/api/report/'+str(self.report.id)+'/validate/', data={}, HTTP_AUTHORIZATION=self.AuthorizationModerator)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the report is validated in the database
        report = Reports.objects.get(id=self.report.id)
        self.assertTrue(report.valide)
        self.assertEqual(report.moderatorid.id,self.globuser.moderator.id)

class InvalidateReportTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.user1 = User(email="test@test333.com",user_type=4,username="mobile")
        cls.user1.save()
        cls.token_user1 = Token.objects.get(user=cls.user1).key
        cls.AuthorizationMobile = "Token "+ str(cls.token_user1)       


        cls.user2 = User(email="test@test.com",user_type=2,username="red")
        cls.user2.save()
        cls.report = Reports.objects.create(
            symptoms='TestCase',
            address="Wearetestingamethodpost",
            mobileuserid=cls.user1.mobileuser,
            )
        cls.globuser = User.objects.create(email="mod@mod.mod",user_type=1,username="test")
        cls.token_globuser = Token.objects.get(user=cls.globuser).key
        cls.AuthorizationModerator = "Token "+ str(cls.token_globuser) 

    def test_patch_by_moderator(self):
        response = self.client.patch('/api/report/'+str(self.report.id)+'/invalidate/', data={}, HTTP_AUTHORIZATION=self.AuthorizationModerator)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the report is validated in the database
        report = Reports.objects.get(id=self.report.id)
        self.assertFalse(report.valide)
        self.assertEqual(report.moderatorid.id,self.globuser.moderator.id)