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
    shop_name = serializers.CharField(source='shop_inf.shop_name')

    def create(self, validated_data):
        shop_name = validated_data['shop_inf'].get('shop_name')
        shop_info_instance = ShopInfo.objects.filter(shop_name=shop_name).first()
        validated_data['shop_inf'] = shop_info_instance  # update validated_data in order to pass shop_info instance
        return Product.objects.create(**validated_data)

    class Meta:
        model = Product
        fields = ('id', 'creator', 'shop_name', 'title', 'category',
                  'description', 'image', 'price', 'quantity', 'size', 'color')


class ShopSerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True)
    shop_name = serializers.CharField(source='shop_info.shop_name')

    def create(self, validated_data):
        print(validated_data)
        shop_name = validated_data['shop_info'].get('shop_name')
        shop_info_instance = ShopInfo.objects.filter(shop_name=shop_name).first()
        # validated_data['shop_info'] = shop_info_instance  # update validated_data in order to pass shop_info instance
        products = validated_data.pop('products')

        shops, created = Shop.objects.update_or_create(
            shop_info__shop_name=validated_data['shop_info'].get('shop_name'),
            defaults={'shop_info': shop_info_instance}
        )
        print(created)
        for product in products:
            shops.products.add(product)
        return shops

    class Meta:
        model = Shop
        fields = ('id', 'shop_name', 'products')
