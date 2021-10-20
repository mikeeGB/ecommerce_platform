from django.contrib import admin
from .models import Product, Shop, Cart, ProductCategory

admin.site.register(Product)
admin.site.register(Shop)
admin.site.register(Cart)
admin.site.register(ProductCategory)
