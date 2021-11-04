from rest_framework import permissions, viewsets
from shopapp.models import Product, Shop
from .serializers import ProductSerializer, ShopSerializer


class ProductViewSet(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(creator=self.request.user)


class ShopViewSet(viewsets.ModelViewSet):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        product_set = Product.objects.filter(creator=self.request.user).all()
        serializer.save(user=self.request.user, products=product_set)
