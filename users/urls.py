from django.urls import path
#from rest_framework.authtoken.views import obtain_auth_token
from users.views import WebUsersList,AgentList,ModeratorList,RedactorList,MobileUserList, AdminList, OwnerDetail, ObtainAuthToken, UserDetail, UsersList, GoogleSign, EmailSign, AdminSign, AdminDetail,ModeratorDetail,AgentDetail,RedactorDetail,MobileDetail

urlpatterns = [
    path('', UsersList.as_view()),
    path('<int:pk>/', UserDetail.as_view()),

    path('myinfo/', OwnerDetail.as_view()),

    path('web/', WebUsersList.as_view()),
    path('admin/', AdminList.as_view()),
    path('admin/<int:pk>/', AdminDetail.as_view()),
    path('moderator/', ModeratorList.as_view()),
    path('moderator/<int:pk>/', ModeratorDetail.as_view()),
    path('agent/', AgentList.as_view()),
    path('agent/<int:pk>/', AgentDetail.as_view()),
    path('redactor/', RedactorList.as_view()),
    path('redactor/<int:pk>/', RedactorDetail.as_view()),
    path('mobile/', MobileUserList.as_view()),
    path('mobile/<int:pk>/', MobileDetail.as_view()),

    path('googlesign/', GoogleSign.as_view()),
    path('emailsign/', EmailSign.as_view()),
    path('adminsign/', AdminSign.as_view()),
    path('login/', ObtainAuthToken.as_view())
]
