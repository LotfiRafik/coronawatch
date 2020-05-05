from django.urls import path

from geo.views import (CountryDetail, CountryList,
                       RegionDetail, RegionList, infectedRegionHistory,
                       InfectedRegionList)

urlpatterns = [
    #GET country list , POST new country
    path('country/', CountryList.as_view()),
    #GET country detail
    path('country/<int:pk>/', CountryDetail.as_view()),

    #GET region list, POST new region
    path('region/', RegionList.as_view()),
    #GET region detail
    path('region/<int:pk>/', RegionDetail.as_view()),

    #GET infected region list OR POST new infected region
    path('infectedregion/', InfectedRegionList.as_view()),

    #GET history of an infected region 
    path('infectedregion/get-history/<int:regionid>/', infectedRegionHistory.as_view()),
]
