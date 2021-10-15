from django.contrib import admin
from .models import ShopType, ProductCategory, Product, Shop, CartProduct, Cart

# Register your models here.
admin.site.register(ShopType)
admin.site.register(Shop)
admin.site.register(ProductCategory)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(CartProduct)
