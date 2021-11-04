from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Product, Shop


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username']


class ProductSerializer(serializers.ModelSerializer):
    creator = serializers.ReadOnlyField(source='creator.username')

    class Meta:
        model = Product
        fields = ('id', 'creator', 'title', 'category', 'description', 'image', 'price', 'quantity', 'size', 'color')


class ShopSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')
    products = ProductSerializer(many=True, read_only=True)

    class Meta:
        model = Shop
        fields = ('id', 'shop_name', 'user', 'products')
