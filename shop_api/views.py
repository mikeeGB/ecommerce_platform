from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, exceptions, filters
from .models import Product, Shop, ShopInfo
from .serializers import ProductSerializer, ShopSerializer, ShopInfoSerializer
from .permissions import ShopInfoWritePermission, ShopWritePermission, ProductWritePermission


# Create your views here.
def index_view(request):
    return render(request, 'index.html')


class ProductViewSet(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = [ProductWritePermission]
    filter_backends = [filters.SearchFilter]
    search_fields = ['$title']

    def get_shop_names(self):
        shop_infos = ShopInfo.objects.filter(owner=self.request.user)
        shop_names = [shop_info.shop_name for shop_info in shop_infos]
        print(shop_names)
        return shop_names

    def perform_create(self, serializer):
        print(serializer.validated_data)
        if serializer.validated_data['shop_inf'].get('shop_name') not in self.get_shop_names():
            raise exceptions.PermissionDenied(
                detail="You don't have a permission. Choose your shop"
            )

        serializer.save(creator=self.request.user)


class ShopViewSet(viewsets.ModelViewSet):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
    permission_classes = [ShopWritePermission]

    def get_object(self, **kwargs):
        """Get individual shop, using shop_info pk"""
        shop = self.kwargs.get('pk')  # id from url
        return get_object_or_404(Shop, shop_info=shop)

    def get_shop_names(self):
        shop_infos = ShopInfo.objects.filter(owner=self.request.user)
        shop_names = [shop_info.shop_name for shop_info in shop_infos]
        print(shop_names)
        return shop_names

    def perform_create(self, serializer):
        shop_name = self.request.data['shop_name']
        product_set = Product.objects.filter(shop_inf__shop_name=shop_name).all()

        if not product_set:
            # if no products added to the shop - raise error
            raise exceptions.NotFound(
                detail="Products not found. Please add products to your shop first"
            )
        if serializer.validated_data['shop_info'].get('shop_name') not in self.get_shop_names():
            raise exceptions.PermissionDenied(
                detail="You don't have a permission. Choose your shop"
            )
        serializer.save(products=product_set)


class ShopInfoViewSet(viewsets.ModelViewSet):
    permission_classes = [ShopInfoWritePermission]
    serializer_class = ShopInfoSerializer
    queryset = ShopInfo.objects.all()

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
