from django.shortcuts import render
from rest_framework import permissions, viewsets
from .models import Product, Shop, ShopInfo
from .serializers import ProductSerializer, ShopSerializer, ShopInfoSerializer


# Create your views here.
def index_view(request):
    return render(request, 'index.html')


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
        shop_inf_id_from_req = int(self.request.data['shop_info'])
        product_set = Product.objects.filter(shop_inf_id=shop_inf_id_from_req).all()
        serializer.save(products=product_set)


class ShopInfoViewSet(viewsets.ModelViewSet):
    serializer_class = ShopInfoSerializer
    queryset = ShopInfo.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
