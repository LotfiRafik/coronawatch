from django.urls import path
from rest_framework.authtoken.views import obtain_auth_token

from geo.views import (CountryDetail, CountryList,
                       RegionDetail, RegionList, infectedRegionHistory,
                       InfectedRegion)

urlpatterns = [
    #GET country list
    path('country/', CountryList.as_view()),
    #GET country detail
    path('country/<int:pk>/', CountryDetail.as_view()),

    #GET region list
    path('region/', RegionList.as_view()),
    #GET region detail
    path('region/<int:pk>/', RegionDetail.as_view()),

    #GET infected region list OR POST new infected region
    path('infectedregion/', InfectedRegion.as_view()),

    #GET history of an infected region 
    path('infectedregion/get-history/<int:regionid>/', infectedRegionHistory.as_view()),
]
