from rest_framework import generics, permissions
from shopapp.models import Product, Shop
from .serializers import ProductSerializer, ShopSerializer


class ProductList(generics.ListCreateAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class ProductDetail(generics.RetrieveAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class ShopList(generics.ListCreateAPIView):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()

    def perform_create(self, serializer):
        product_set = Product.objects.filter(creator=self.request.user).all()
        serializer.save(user=self.request.user, products=product_set)


class ShopDetail(generics.RetrieveAPIView):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
