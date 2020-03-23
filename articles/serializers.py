from rest_framework import serializers
from .models import Article,commentArticle,attachmentArticle

class CommentArtcileSerializer(serializers.ModelSerializer):
    class Meta:
        model=commentArticle
        fields=['id','content','date','mobileuserid','articleid']


class AttachementSerializer(serializers.ModelSerializer):
    class Meta:
        model = attachmentArticle
        fields = ['attachment_type', 'path']


class ArticleSerializer(serializers.ModelSerializer):
    attachments = AttachementSerializer(many=True, read_only=True)
    
    class Meta:
        model = Article
        fields = ['id', 'title', 'content', 'date', 'redactor', 'moderatorid','valide', 'attachments']


