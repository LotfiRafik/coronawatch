from django.shortcuts import render
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.utils import json
import requests
from rest_framework.permissions import IsAuthenticated
from rest_framework.schemas.openapi import AutoSchema
from .models import PhotoAnalyze
from .serializers import PhotoAnalyzeSerializer
import os
import cloudinary
import cloudinary.uploader
import cloudinary.api

# Create your views here.

class PhotoAnalyzeList(APIView):
    """
    List all photos that users have send to the Server to be analyzed, or create a new user.
    """

    #schema = AutoSchema(operation_id_base="PhotoAnalyze")
    #permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        photos = PhotoAnalyze.objects.all()
        serializer = PhotoAnalyzeSerializer(photos, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):

        data = request.data.copy()
        print(request.user.mobileuser.pk)
        data['mobileuserid'] = request.user.mobileuser.pk
        serializer = PhotoAnalyzeSerializer(data=data)
        if serializer.is_valid():
            try:
                out = cloudinary.uploader.upload(request.FILES["photo"], folder="health")
            except cloudinary.exceptions.Error:
                print(cloudinary.exceptions.Error)
                return Response(cloudinary.exceptions.Error, status=status.HTTP_400_BAD_REQUEST)
            print(out['url'])
            serializer.validated_data['photo'] = out['url']
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



# Listen for GET requests to yourdomain.com/sign_s3/
#
# Please see https://gist.github.com/RyanBalfanz/f07d827a4818fda0db81 for an example using
# Python 3 for this view.

    


#class S3Detail(APIView):
#    """
#    Retrieve aws s3 storage signed request .
#    """
#    permission_classes = [IsAuthenticated]

    # def get(self, request, filename, filetype, format=None):

    #     S3_BUCKET = os.environ.get('S3_BUCKET')

    #     # Initialise the S3 client
    #     s3 = None

    #     # Generate and return the presigned URL
    #     presigned_post = s3.generate_presigned_post(
    #         Bucket=S3_BUCKET,
    #         Key=filename,
    #         Fields={"acl": "public-read", "Content-Type": filetype},
    #         Conditions=[
    #             {"acl": "public-read"},
    #             {"Content-Type": filetype}
    #         ],
    #         ExpiresIn=3600
    #     )
    #     # Return the data to the client
    #     return json.dumps({
    #         'data': presigned_post,
    #         'url': 'https://%s.s3.amazonaws.com/%s' % (S3_BUCKET, filename)
    #     })