from django.urls import path
from ecommerce_api.views import ProductViewSet, ShopViewSet

urlpatterns = [
    path('products/<int:pk>/', ProductViewSet.as_view({'get': 'retrieve'})),
    path('products/', ProductViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('shops/', ShopViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('shops/<int:pk>/', ShopViewSet.as_view({'get': 'retrieve'})),
]
