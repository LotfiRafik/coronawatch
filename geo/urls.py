from django.urls import path

from geo.views import (CountryDetail, CountryList,
                       RegionDetail, RegionList, infectedRegionHistory,
                       InfectedRegionList, InvalidateRegionRisk, ValidateRegionRisk,DeclareRegionRisk, IndeclareRegionRisk
                       ,InvalidateInfectedRegion,total_world ,total_country, InfectedRegionWithHistoryList,ValidateInfectedRegion,InfectedRegionCountry)

urlpatterns = [

    #moderator  invalidate an infected region  (id) #PATCH  #need unit test
    path('worldstats/', total_world),

    
    #GET country list , POST new country
    path('country/', CountryList.as_view()),
    #GET country detail
    path('country/<int:pk>/', CountryDetail.as_view()),

    #GET  infected regions of a country
    path('country/<int:id>/infectedregions/', InfectedRegionCountry.as_view()),


    #moderator  invalidate an infected region  (id) #PATCH  #need unit test
    path('country/<int:pk>/stats/', total_country),


    #GET region list, POST new region
    path('region/', RegionList.as_view()),

    #GET region detail
    path('region/<int:pk>/', RegionDetail.as_view()),

    #health agent declare a region as a risk region (id) #PATCH
    path('region/<int:id>/risk/', DeclareRegionRisk.as_view()),

    #health agent indeclare risk region (id) #PATCH
    path('region/<int:id>/inrisk/', IndeclareRegionRisk.as_view()),
    
    #moderator validate region as risk region (id) #PATCH
    path('region/<int:id>/validaterisk/', ValidateRegionRisk.as_view()),

    #moderator Invalidate  risk region (id) #PATCH
    path('region/<int:id>/invalidaterisk/', InvalidateRegionRisk.as_view()),

    #GET infected region list OR POST new infected region
    path('infectedregion/', InfectedRegionList.as_view()),


    #GET infected region list with history of each region
    path('infectedregion/get-history/', InfectedRegionWithHistoryList.as_view()),
    

    #GET history of an infected region 
    path('infectedregion/get-history/<int:regionid>/', infectedRegionHistory.as_view()),


    #moderator validate an infected region (id) #PATCH  #need unit test
    path('infectedregion/<int:id>/validate/', ValidateInfectedRegion.as_view()),

    #moderator  invalidate an infected region  (id) #PATCH  #need unit test
    path('infectedregion/<int:id>/invalidate/', InvalidateInfectedRegion.as_view()),



   
]
