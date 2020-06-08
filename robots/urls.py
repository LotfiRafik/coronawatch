from django.urls import path
from robots.views import (CommentRobotList,CommentRobotDetail, RobotContentList,YoutubeConfig, RobotContentDetail,ValidateRobotContent, InvalidateRobotContent)


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


    #all comments of a Robot-content (id) or create new comment on that content #GET,POST
    path('<int:id>/comments/',CommentRobotList.as_view()),

    
    #get comment detail     #GET/PUT/PATCH/DELETE
    path('comments/<int:id>/',CommentRobotDetail.as_view()),

    
    ]
