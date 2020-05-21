from django.urls import path
from reporting.views import (ReportList, ReportDetail,ValidateReport, InvalidateReport)


urlpatterns = [

    #get all reports  or create new report   #GET,POST
    path('',ReportList.as_view()),


    #get report (id) detail  #GET
    path('<int:id>/',ReportDetail.as_view()), 

    #moderator validate a report (id) #PATCH
    path('<int:id>/validate/', ValidateReport.as_view()),

    #moderator Invalidate a report (id) #PATCH
    path('<int:id>/invalidate/', InvalidateReport.as_view()),
    
    
    ]
