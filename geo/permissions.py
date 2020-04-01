from rest_framework.permissions import (SAFE_METHODS, BasePermission,
                                        IsAuthenticated)


class AdminOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 0

class AgentOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user.user_type == 2

class IsNotAuthenticated(BasePermission):
    def has_permission(self, request, view):
        valide = request.user.is_authenticated
        return(not valide)


class OwnerOnly(BasePermission):
    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        if valide:
            return(obj == request.user)
        return False

class AgentOnly_Object(BasePermission):
    def has_object_permission(self, request, view, obj):
        valide = request.user.is_authenticated
        if valide:
            return(request.user.user_type == 2)
        return False

class IsAgentOrReadOnly(BasePermission):
    """
    The request is authenticated as a agent, or is a read-only request.
    """

    def has_permission(self, request, view):
        if(request.method in SAFE_METHODS):
            return True
        else:
            valide = request.user.is_authenticated
            if valide:
                return(request.user.user_type == 2)
            return False