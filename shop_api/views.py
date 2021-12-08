from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, exceptions, filters, generics
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

    def perform_create(self, serializer):
        if serializer.validated_data['shop_inf'].owner != self.request.user:
            # check if chosen shop_inf owner is current user, if not - raise exception
            raise exceptions.PermissionDenied(
                detail="You don't have a permission. Choose your shop"
            )
        serializer.save(creator=self.request.user)


class ProductsOfCurrentUser(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        user = self.request.user
        return Product.objects.filter(creator=user)


class ShopViewSet(viewsets.ModelViewSet):
    serializer_class = ShopSerializer
    queryset = Shop.objects.all()
    permission_classes = [ShopWritePermission]

    def get_object(self, **kwargs):
        """Get individual shop, using shop_info pk"""
        shop = self.kwargs.get('pk')  # id from url
        return get_object_or_404(Shop, shop_info=shop)

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
    permission_classes = [ShopInfoWritePermission]
    serializer_class = ShopInfoSerializer
    queryset = ShopInfo.objects.all()

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
