from rest_framework import permissions


class ShopInfoWritePermission(permissions.BasePermission):
    message = 'Editing shop info is restricted to the owner only'

    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True

        return obj.owner == request.user


class ShopWritePermission(permissions.BasePermission):
    message = 'Editing shop  is restricted to the owner only'

    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True

        return obj.shop_info.owner == request.user


class ProductWritePermission(permissions.BasePermission):
    message = 'Editing products is restricted to the creator only'

    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True

        return obj.creator == request.user
