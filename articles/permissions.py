from rest_framework.permissions import BasePermission, IsAuthenticated, SAFE_METHODS

class AdminOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 0

class ModeratorOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 1


class RedactorOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 3

class MobileUserOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 4

class IsNotAuthenticated(BasePermission):
    def has_permission(self, request, view):
        valide = request.user.is_authenticated
        return(not valide)


class OwnerOnly(BasePermission):
    def has_object_permission(self, request, view, obj):
        print(obj)
        return(obj == request.user)


class OwnerOrModerator(BasePermission):

    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        if valide:
            return(request.user.user_type == 1 or obj == request.user)
        return False


class ArticleOwnerOrModerator(BasePermission):

    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        #if user is authenticated
        if valide:
            #if the user is a moderator then he can GET,OPTION,HEAD the article but cannot delete patch ..ext
            if(request.user.user_type == 1):
                return request.method in SAFE_METHODS
            #else only the redactor owner of the article can do what ever he wants
            return(obj == request.user)
        return False


