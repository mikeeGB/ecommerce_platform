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
        fields = '__all__'


class ShopSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    products = ProductSerializer(many=True)

    class Meta:
        model = Shop
        fields = '__all__'


class CartSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    products = ProductSerializer(many=True)

    class Meta:
        model = Cart
        fields = '__all__'
