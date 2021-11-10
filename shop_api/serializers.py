from .models import NewUser
from rest_framework import serializers
from .models import Product, Shop, ShopInfo


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewUser
        fields = ['email', 'user_name']


class ShopInfoSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.user_name')

    class Meta:
        model = ShopInfo
        fields = ('id', 'shop_name', 'owner')


class ProductSerializer(serializers.ModelSerializer):
    creator = serializers.ReadOnlyField(source='creator.email')

    class Meta:
        model = Product
        fields = ('id', 'creator', 'shop_inf', 'title', 'category', 'description', 'image', 'price', 'quantity', 'size', 'color')


class ShopSerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True)

    class Meta:
        model = Shop
        fields = ('id', 'shop_info', 'products')

