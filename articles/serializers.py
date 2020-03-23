from rest_framework import serializers
from .models import Article,commentArticle

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ['id', 'title', 'content', 'date', 'redactor', 'moderatorid','valide']
class CommentArtcileSerializer(serializers.ModelSerializer):
    class Meta:
        model=commentArticle
        fields=['id','content', 'date','mobileuserid','articleid']
