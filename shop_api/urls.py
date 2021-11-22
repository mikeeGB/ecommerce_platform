from django.urls import path
from .views import ProductViewSet, ShopViewSet, ShopInfoViewSet

urlpatterns = [
    path('products/', ProductViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('shops/', ShopViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('shop_info/', ShopInfoViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('products/<int:pk>/', ProductViewSet.as_view({'get': 'retrieve', 'put': 'update',
                                                       'patch': 'partial_update', 'delete': 'destroy'})),
    path('shops/<int:pk>/', ShopViewSet.as_view({'get': 'retrieve', 'put': 'update',
                                                        'patch': 'partial_update', 'delete': 'destroy'})),
    path('shop_info/<int:pk>/', ShopInfoViewSet.as_view({'get': 'retrieve', 'put': 'update',
                                                         'patch': 'partial_update', 'delete': 'destroy'})),
]
