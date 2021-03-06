from django.urls import path
from articles.views import attachmentArticleDetail,InvalidateArticle,attachmentArticleView, ArticleList,ArtcileDetail,NewArticle,CommentArticleList,CommentArticleDetail,NewCommentArticle, ValidateArticle

urlpatterns = [

    #get all articles    #GET
    path('',ArticleList.as_view()),

    #all comments of an article (id) #GET
    path('<int:id>/comments/',CommentArticleList.as_view()),

    #create new article #POST
    path('new/',NewArticle.as_view()), 

    #create new comment on an article (id)   #POST
    path('<int:id>/newComment/',NewCommentArticle.as_view()),


    #add/delete attachment to an article (id)   #POST
    path('<int:id>/attachments/',attachmentArticleView.as_view()),


    #delete attachment from an article (id)   #DELETE
    path('attachment/<int:id>/',attachmentArticleDetail.as_view()),


    #get/delete/edit article (id) detail  #GET/DELETE/PATCH
    path('detail/<int:id>/',ArtcileDetail.as_view()), 

    
    #get comment detail     #GET/PUT/PATCH/DELETE
    path('detailComment/<int:id>/',CommentArticleDetail.as_view()),

    #moderator validate an article (id) #PATCH
    path('<int:id>/validate/', ValidateArticle.as_view()),

    #moderator Invalidate an article (id) #PATCH
    path('<int:id>/invalidate/', InvalidateArticle.as_view()),
    
    
    ]
