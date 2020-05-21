from rest_framework.permissions import BasePermission, IsAuthenticated, SAFE_METHODS


class ModeratorOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 1

class MobileUserOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 4


class MobileUserOrReadOnly(BasePermission):
    def has_permission(self, request, view):
        if request.method in SAFE_METHODS:
            return True
        else:
            valide = request.user.is_authenticated
            if valide:
                return(request.user.user_type == 4)
            return False


class OwnerOrModerator(BasePermission):

    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        if valide:
            return(request.user.user_type == 1 or obj == request.user)
        return False


class ReportOwnerOrModerator(BasePermission):

    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        #if user is authenticated
        if valide:
            if(request.user.user_type == 1):
                return request.method in SAFE_METHODS
            #else only the report owner  can do what ever he wants
            return(obj == request.user)
        return False


