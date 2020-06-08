from django.urls import path
from robots.views import (RobotContentList,YoutubeConfig, RobotContentDetail,ValidateRobotContent, InvalidateRobotContent)


urlpatterns = [

    #get all robots content  #GET
    #Filter : ?source={facebook,youtube,webs}
    path('',RobotContentList.as_view()),


    #get robot content (id) detail  #GET
    path('<int:id>/',RobotContentDetail.as_view()), 

    #moderator validate a robot content  (id) #PATCH
    path('<int:id>/validate/', ValidateRobotContent.as_view()),

    #moderator Invalidate a robot content  (id) #PATCH
    path('<int:id>/invalidate/', InvalidateRobotContent.as_view()),
    
    #moderator get,set youtube robot configuration
    path('config/youtube/',YoutubeConfig.as_view()),

    
    ]
