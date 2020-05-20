from django.urls import path
from videosHomePage.views import (InvalidateVideo, VideoList,
                          VideoDetail,CommentVideoList,
                          CommentVideoDetail, ValidateVideo)


urlpatterns = [

    #get all videos  or create new video   #GET,POST
    path('',VideoList.as_view()),


    #get/delete/edit video (id) detail  #GET/DELETE/PATCH
    path('<int:id>/',VideoDetail.as_view()), 

    #all comments of a  video (id) or create new comment on that video #GET,POST
    path('<int:id>/comments/',CommentVideoList.as_view()),

    
    #get comment detail     #GET/PUT/PATCH/DELETE
    path('comments/<int:id>/',CommentVideoDetail.as_view()),

    #moderator validate a video (id) #PATCH
    path('<int:id>/validate/', ValidateVideo.as_view()),

    #moderator Invalidate a video (id) #PATCH
    path('<int:id>/invalidate/', InvalidateVideo.as_view()),
    
    
    ]
