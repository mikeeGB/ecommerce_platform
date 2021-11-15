from django.shortcuts import render
from rest_framework import permissions, viewsets, exceptions
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
        if serializer.validated_data['shop_inf'].owner != self.request.user:
            # check if chosen shop_inf owner is current user, if not - raise exception
            raise exceptions.PermissionDenied(
                detail="You don't have a permission. Choose your shop"
            )
        serializer.save(creator=self.request.user)


class ShopViewSet(viewsets.ModelViewSet):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        shop_inf_id_from_req = int(self.request.data['shop_info'])
        product_set = Product.objects.filter(shop_inf_id=shop_inf_id_from_req).all()
        if not product_set:
            # if no products added to the shop - raise error
            raise exceptions.NotFound(
                detail="Products not found. Please add products to your shop first"
            )
        if serializer.validated_data['shop_info'].owner != self.request.user:
            # check if chosen shop_info owner is current user, if not - raise exception
            raise exceptions.PermissionDenied(
                detail="You don't have a permission. Choose your shop"
            )
        serializer.save(products=product_set)


class ShopInfoViewSet(viewsets.ModelViewSet):
    serializer_class = ShopInfoSerializer
    queryset = ShopInfo.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
