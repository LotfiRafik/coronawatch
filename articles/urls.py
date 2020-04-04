from django.urls import path
from articles.views import ArticleList,ArtcileDetail,NewArticle,CommentArticleList,CommentArticleDetail,NewCommentArticle, ValidateArticle

urlpatterns = [

    #get all articles    #GET
    path('',ArticleList.as_view()),

    #all comments of an article (id) #GET
    path('<int:id>/comments/',CommentArticleList.as_view()),

    #create new article #POST
    path('new/',NewArticle.as_view()), 

    #create new comment on an article (id)   #POST
    path('<int:id>/newComment/',NewCommentArticle.as_view()),

    #get/delete article (id) detail  #GET/DELETE
    path('detail/<int:id>/',ArtcileDetail.as_view()), 

    
    #get comment detail     #GET/PUT/PATCH/DELETE
    path('detailComment/<int:id>/',CommentArticleDetail.as_view()),

    #moderator validate an article (id) #PATCH
    path('<int:id>/validate/', ValidateArticle.as_view()),
    
    ]
