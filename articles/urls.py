from django.urls import path
from articles.views import ArticleList,ArtcileDetail,NewArticle,CommentArticleList,CommentArticleDetail,NewCommentArticle

urlpatterns = [
    path('/',ArticleList.as_view()),
    path('/comment/',CommentArticleList.as_view()),
    path('/new/',NewArticle.as_view()), 
    path('/newComment/',NewCommentArticle.as_view()),
    path('/detail/<int:id>/',ArtcileDetail.as_view()), 
    path('/detailComment/<int:id>/',CommentArticleDetail.as_view()),
    ]
