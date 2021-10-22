from django.contrib.auth.models import User
from rest_framework import serializers
from shopapp.models import Product, Shop, Cart


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username']


class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('id', 'creator', 'title', 'category', 'description', 'image', 'price', 'quantity', 'size', 'color')


class ShopSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')
    products = ProductSerializer(many=True, read_only=True)

    class Meta:
        model = Shop
        fields = ('id', 'shop_name', 'user', 'products')


class CartSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    products = ProductSerializer(many=True)

    class Meta:
        model = Cart
        fields = '__all__'
