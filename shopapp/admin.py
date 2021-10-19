from django.contrib import admin
from .models import ProductCategory, Product, Shop, Cart

admin.site.register(Product)
admin.site.register(ProductCategory)
admin.site.register(Shop)
admin.site.register(Cart)
