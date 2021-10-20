from rest_framework import generics, permissions, status
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from shopapp.models import Product, Shop
from .serializers import ProductSerializer, ShopSerializer, CartSerializer


class ProductList(generics.ListCreateAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class ProductDetail(generics.RetrieveAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class ShopList(generics.ListCreateAPIView):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
