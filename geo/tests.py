import json
from unittest.mock import Mock, patch

from django.test import TestCase
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase

from .models import *
from users.models import User
from .serializers import *
import datetime


# Create your tests here.

class CountryListTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key
        cls.Authorization = "Token "+ str(cls.token_agent)  


    def test_get(self):
        response=self.client.get('/api/geo/country/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)


    def test_post(self):
        data = {'name':'USA','code':'us'}
        response = self.client.post("/api/geo/country/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that the country is actualy created in the database
        self.assertEqual(Countries.objects.count(), 2)
        country = Countries.objects.last()
        self.assertEqual(country.name, 'USA')
        self.assertEqual(country.code, 'us')
        #test that response has the correct data
        self.assertIn('id',response.data)
        self.assertIn('name',response.data)
        self.assertIn('code',response.data)
        self.assertEqual(response.data['name'],data['name'])
        self.assertEqual(response.data['code'],data['code'])


    #test non auth users
    def test_post_user_without_credentials(self):
        data = {'name':'Spain','code':'sp'}
        response = self.client.post("/api/geo/country/", data=data)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        #test that the country is not created in the database
        self.assertEqual(Countries.objects.count(), 1)

    #test non agent users
    def test_post_user_with_nonagent_credentials(self):
        data = {'name':'France','code':'fr'}
        response = self.client.post("/api/geo/country/", data=data, HTTP_AUTHORIZATION="Token "+ str(self.token_nagent))
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)
        #test that the country is not created in the database
        self.assertEqual(Countries.objects.count(), 1)


class CountryDetailTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key
        cls.Authorization = "Token "+ str(cls.token_agent)          

    def test_get(self):
        response=self.client.get('/api/geo/country/'+str(self.country.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('id',response.data)
        self.assertIn('name',response.data)
        self.assertIn('code',response.data)
        self.assertIn('regions',response.data)
        self.assertEqual(response.data['name'],self.country.name)
        self.assertEqual(response.data['code'],self.country.code)



class RegionListTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=True,
            riskregion=True
            )
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key
        cls.Authorization = "Token "+ str(cls.token_agent)  


    def test_get(self):
        response=self.client.get('/api/geo/region/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)


    def test_post(self):
        data = {
                'region_name':'Blida','code':'09','country':self.country.id,'latitude':1.50,
                'longitude':43.50,'riskvalide':True,'riskregion':True
                }
        response = self.client.post("/api/geo/region/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        print(response.data)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that the region is actualy created in the database
        self.assertEqual(Regions.objects.count(), 2)
        region = Regions.objects.last()
        self.assertEqual(region.region_name, data['region_name'])
        self.assertEqual(region.code, data['code'])
        self.assertEqual(region.country.id, data['country'])
        self.assertEqual(region.latitude, data['latitude'])
        self.assertEqual(region.longitude, data['longitude'])
        self.assertEqual(region.riskvalide, False)
        self.assertEqual(region.riskregion, data['riskregion'])
        #test that response has the correct data
        self.assertIn('region_name',response.data)
        self.assertIn('code',response.data)
        self.assertIn('country',response.data)
        self.assertIn('latitude',response.data)
        self.assertIn('longitude',response.data)
        self.assertIn('riskagentid',response.data)
        self.assertIn('riskvalide',response.data)
        self.assertIn('riskregion',response.data)
        self.assertEqual(response.data['region_name'],data['region_name'])
        self.assertEqual(response.data['code'],data['code'])
        self.assertEqual(response.data['country'],data['country'])
        self.assertEqual(response.data['riskagentid'],self.agent.agent.id)
        self.assertFalse(response.data['riskvalide'])
        self.assertEqual(response.data['riskregion'],True)



    #test non auth users
    def test_post_user_without_credentials(self):
        data = {
                'region_name':'Blida','code':'09','country':self.country,'latitude':1.50,
                'longitude':43.50,'riskvalide':True,'riskregion':True
                }        
        response = self.client.post("/api/geo/country/", data=data)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        #test that the region is not created in the database
        self.assertEqual(Regions.objects.count(), 1)


    #test non agent users
    def test_post_user_with_nonagent_credentials(self):
        data = {
                'region_name':'Blida','code':'09','country':self.country,'latitude':1.50,
                'longitude':43.50,'riskvalide':True,'riskregion':True
                }       
        response = self.client.post("/api/geo/country/", data=data, HTTP_AUTHORIZATION="Token "+ str(self.token_nagent))
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)
        #test that the region is not created in the database
        self.assertEqual(Regions.objects.count(), 1)



class RegionDetailTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskregion=True,
            riskagentid=cls.agent.agent
            )

    def test_get(self):
        response=self.client.get('/api/geo/region/'+str(self.region.id)+'/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('region_name',response.data)
        self.assertIn('code',response.data)
        self.assertIn('country',response.data)
        self.assertIn('latitude',response.data)
        self.assertIn('longitude',response.data)
        self.assertIn('riskagentid',response.data)
        self.assertIn('riskvalide',response.data)
        self.assertIn('riskregion',response.data)
        self.assertEqual(response.data['region_name'],self.region.region_name)
        self.assertEqual(response.data['code'],self.region.code)
        self.assertEqual(response.data['country'],self.region.country.id)
        self.assertEqual(response.data['riskagentid'],self.agent.agent.id)
        self.assertFalse(response.data['riskvalide'])
        self.assertTrue(response.data['riskregion'])




class InfectedRegionListTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.Authorization = "Token "+ str(cls.token_agent)
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=True,
            riskregion=True
            )
        cls.newregion = Regions.objects.create(
            region_name="Alger",
            code="16",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=True,
            riskregion=True
            )
        cls.infectedRegion = infectedRegions.objects.create(
                        nb_death=2,nb_recovered=2,regionid=cls.region,
                        agentid=cls.agent.agent,nb_notyetsick=5,
                        nb_suspected=3,nb_confirmed=9
                        )
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key



    def test_get(self):
        response=self.client.get('/api/geo/infectedregion/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that response has the correct data
        self.assertIn('nb_death',response.data[0])
        self.assertIn('nb_recovered',response.data[0])
        self.assertIn('date',response.data[0])
        self.assertIn('valide',response.data[0])
        self.assertIn('nb_notyetsick',response.data[0])
        self.assertIn('nb_suspected',response.data[0])
        self.assertIn('nb_confirmed',response.data[0])
        self.assertIn('regionid',response.data[0])
        self.assertIn('agentid',response.data[0])
        self.assertEqual(response.data[0]['nb_death'],self.infectedRegion.nb_death)
        self.assertEqual(response.data[0]['nb_recovered'],self.infectedRegion.nb_recovered)
        self.assertEqual(response.data[0]['date'],str(datetime.date.today()))
        self.assertFalse(response.data[0]['valide'])
        self.assertEqual(response.data[0]['nb_notyetsick'],self.infectedRegion.nb_notyetsick)
        self.assertEqual(response.data[0]['nb_suspected'],self.infectedRegion.nb_suspected)
        self.assertEqual(response.data[0]['nb_confirmed'],self.infectedRegion.nb_confirmed)
        self.assertEqual(response.data[0]['regionid'],self.infectedRegion.regionid.id)
        self.assertEqual(response.data[0]['agentid'],self.infectedRegion.agentid.id)



    def test_post_same_infectedregion_sameday(self):
        data = {'nb_death':2,'nb_recovered':2,'regionid':self.region.id,'nb_notyetsick':5,
                'nb_suspected':3,'nb_confirmed':9 }
        response = self.client.post("/api/geo/infectedregion/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that infected region is actualy updated in the database
        self.assertEqual(infectedRegions.objects.count(), 1)
        infectedregion = infectedRegions.objects.last()
        self.assertEqual(infectedregion.nb_death, data['nb_death'])
        self.assertEqual(infectedregion.nb_recovered, data['nb_recovered'])
        self.assertEqual(infectedregion.regionid.id, data['regionid'])
        self.assertEqual(infectedregion.nb_notyetsick, data['nb_notyetsick'])
        self.assertEqual(infectedregion.nb_suspected, data['nb_suspected'])
        self.assertEqual(infectedregion.nb_confirmed, data['nb_confirmed'])
        #test that response has the correct data
        self.assertIn('nb_death',response.data)
        self.assertIn('nb_recovered',response.data)
        self.assertIn('date',response.data)
        self.assertIn('valide',response.data)
        self.assertIn('nb_notyetsick',response.data)
        self.assertIn('nb_suspected',response.data)
        self.assertIn('nb_confirmed',response.data)
        self.assertIn('regionid',response.data)
        self.assertIn('agentid',response.data)
        self.assertEqual(response.data['nb_death'],data['nb_death'])
        self.assertEqual(response.data['nb_recovered'],data['nb_recovered'])
        self.assertEqual(response.data['date'],str(datetime.date.today()))
        self.assertFalse(response.data['valide'])
        self.assertEqual(response.data['nb_notyetsick'],data['nb_notyetsick'])
        self.assertEqual(response.data['nb_suspected'],data['nb_suspected'])
        self.assertEqual(response.data['nb_confirmed'],data['nb_confirmed'])
        self.assertEqual(response.data['regionid'],data['regionid'])
        self.assertEqual(response.data['agentid'],self.agent.agent.id)

    def test_post_different_infectedregion(self):
        data = {'nb_death':2,'nb_recovered':2,'regionid':self.newregion.id,'nb_notyetsick':5,
                'nb_suspected':3,'nb_confirmed':9 }
        response = self.client.post("/api/geo/infectedregion/", data=data, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #test that the infected region is actualy created in the database
        self.assertEqual(infectedRegions.objects.count(), 2)
        infectedregion = infectedRegions.objects.last()
        self.assertEqual(infectedregion.nb_death, data['nb_death'])
        self.assertEqual(infectedregion.nb_recovered, data['nb_recovered'])
        self.assertEqual(infectedregion.regionid.id, data['regionid'])
        self.assertEqual(infectedregion.nb_notyetsick, data['nb_notyetsick'])
        self.assertEqual(infectedregion.nb_suspected, data['nb_suspected'])
        self.assertEqual(infectedregion.nb_confirmed, data['nb_confirmed'])
        #test that response has the correct data
        self.assertIn('nb_death',response.data)
        self.assertIn('nb_recovered',response.data)
        self.assertIn('date',response.data)
        self.assertIn('valide',response.data)
        self.assertIn('nb_notyetsick',response.data)
        self.assertIn('nb_suspected',response.data)
        self.assertIn('nb_confirmed',response.data)
        self.assertIn('regionid',response.data)
        self.assertIn('agentid',response.data)
        self.assertEqual(response.data['nb_death'],data['nb_death'])
        self.assertEqual(response.data['nb_recovered'],data['nb_recovered'])
        self.assertEqual(response.data['date'],str(datetime.date.today()))
        self.assertFalse(response.data['valide'])
        self.assertEqual(response.data['nb_notyetsick'],data['nb_notyetsick'])
        self.assertEqual(response.data['nb_suspected'],data['nb_suspected'])
        self.assertEqual(response.data['nb_confirmed'],data['nb_confirmed'])
        self.assertEqual(response.data['regionid'],data['regionid'])
        self.assertEqual(response.data['agentid'],self.agent.agent.id)


    #test non auth users
    def test_post_user_without_credentials(self):
        data = {'nb_death':2,'nb_recovered':2,'regionid':self.newregion.id,'nb_notyetsick':5,
                'nb_suspected':3,'nb_confirmed':9 }
        response = self.client.post("/api/geo/infectedregion/", data=data)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        #test that the infected region is not created in the database
        self.assertEqual(infectedRegions.objects.count(), 1)

    #test non agent users
    def test_post_user_with_nonagent_credentials(self):
        data = {'nb_death':2,'nb_recovered':2,'regionid':self.newregion.id,'nb_notyetsick':5,
                'nb_suspected':3,'nb_confirmed':9 }
        response = self.client.post("/api/geo/infectedregion/", data=data, HTTP_AUTHORIZATION="Token "+ str(self.token_nagent))
        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)
        #test that the infected region is not created in the database
        self.assertEqual(infectedRegions.objects.count(), 1)



class DeclareRegionRiskTestCase(APITestCase):


    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.Authorization = "Token "+ str(cls.token_agent)
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=False,
            riskregion=False
            )
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key

    def test_patch(self):
        response = self.client.patch('/api/geo/region/'+str(self.region.id)+'/risk/', data={}, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the region is a risk region in the database
        region = Regions.objects.get(id=self.region.id)
        self.assertTrue(region.riskregion)
        self.assertEqual(region.riskagentid.id,self.agent.agent.id)
        #test that the response is correct
        self.assertTrue(response.data['riskregion'])


class IndeclareRegionRiskTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.agent = User.objects.create(email="agent@esi.dz",user_type=2,username="agent")
        cls.token_agent = Token.objects.get(user=cls.agent).key
        cls.Authorization = "Token "+ str(cls.token_agent)
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=False,
            riskregion=True
            )
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key

    def test_patch(self):
        response = self.client.patch('/api/geo/region/'+str(self.region.id)+'/inrisk/', data={}, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the region is a risk region in the database
        region = Regions.objects.get(id=self.region.id)
        self.assertFalse(region.riskregion)
        self.assertEqual(region.riskagentid.id,self.agent.agent.id)
        #test that the response is correct
        self.assertFalse(response.data['riskregion'])



class ValidateRegionRiskTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.mod = User.objects.create(email="mod@esi.dz",user_type=1,username="mod")
        cls.token_mod = Token.objects.get(user=cls.mod).key
        cls.Authorization = "Token "+ str(cls.token_mod)
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=False,
            riskregion=True
            )
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key

    def test_patch(self):
        response = self.client.patch('/api/geo/region/'+str(self.region.id)+'/validaterisk/', data={}, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the region is a risk region in the database
        region = Regions.objects.get(id=self.region.id)
        self.assertTrue(region.riskvalide)
        self.assertEqual(region.riskmoderatorid.id,self.mod.moderator.id)
        #test that the response is correct
        self.assertTrue(response.data['riskvalide'])

class InvalidateRegionRiskTestCase(APITestCase):

    @classmethod  # <- setUpClass doit être une méthode de classe, attention !
    def setUpTestData(cls):
        cls.mod = User.objects.create(email="mod@esi.dz",user_type=1,username="mod")
        cls.token_mod = Token.objects.get(user=cls.mod).key
        cls.Authorization = "Token "+ str(cls.token_mod)
        cls.country = Countries.objects.create(name="Algeria",code="dz")
        cls.region = Regions.objects.create(
            region_name="Blida",
            code="09",
            country=cls.country,
            latitude=1.50,
            longitude=43.50,
            riskvalide=True,
            riskregion=True
            )
        cls.nagent = User.objects.create(email="nagent@esi.dz",user_type=3,username="nagent")
        cls.token_nagent = Token.objects.get(user=cls.nagent).key

    def test_patch(self):
        response = self.client.patch('/api/geo/region/'+str(self.region.id)+'/invalidaterisk/', data={}, HTTP_AUTHORIZATION=self.Authorization)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        #test that the region is a risk region in the database
        region = Regions.objects.get(id=self.region.id)
        self.assertFalse(region.riskvalide)
        self.assertEqual(region.riskmoderatorid.id,self.mod.moderator.id)
        #test that the response is correct
        self.assertFalse(response.data['riskvalide'])

