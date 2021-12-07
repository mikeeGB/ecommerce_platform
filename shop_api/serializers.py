from .models import CustomUser
from rest_framework import serializers
from .models import Product, Shop, ShopInfo


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['email', 'user_name']


class ShopInfoSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.user_name')

    class Meta:
        model = ShopInfo
        fields = ('id', 'shop_name', 'owner')


class ProductSerializer(serializers.ModelSerializer):
    creator = serializers.ReadOnlyField(source='creator.email')
    shop_name = serializers.ReadOnlyField(source='shop_inf.shop_name')

    class Meta:
        model = Product
        fields = ('id', 'creator', 'shop_inf', 'shop_name', 'title', 'category',
                  'description', 'image', 'price', 'quantity', 'size', 'color')


class ShopSerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True)
    shop_name = serializers.ReadOnlyField(source='shop_info.shop_name')

    def create(self, validated_data):
        print(validated_data)
        products = validated_data.pop('products')
        # update shop instance if there is object with same shop_info in db, otherwise - create new shop
        shop, created = Shop.objects.update_or_create(
            shop_info=validated_data['shop_info'],
            defaults={'shop_info': validated_data['shop_info']}
        )
        print("Shop created" if created else "Shop updated")
        # adding products to shop instance (m-to-m relation)
        for product in products:
            shop.products.add(product)

        return shop

    class Meta:
        model = Shop
        fields = ('id', 'shop_info', 'shop_name', 'products')
