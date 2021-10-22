from django.urls import path
from .main.views import ProductList, ProductDetail, ShopList, ShopDetail

urlpatterns = [
    path('products/<int:pk>/', ProductDetail.as_view(), name='detailcreate'),
    path('products/', ProductList.as_view(), name='listcreate'),
    path('shops/', ShopList.as_view()),
    path('shops/<int:pk>/', ShopDetail.as_view()),
]
