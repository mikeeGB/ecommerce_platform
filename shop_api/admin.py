from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Product, Shop, ProductCategory, ShopInfo, CustomUser


admin.site.register(Product)
admin.site.register(Shop)
admin.site.register(ProductCategory)
admin.site.register(ShopInfo)


class UserAdminConfig(UserAdmin):
    ordering = ('-date_joined', )
    list_display = ('email', 'user_name', 'first_name', 'is_active', 'is_staff')

    fieldsets = (
        (None, {'fields': ('email', 'user_name', 'first_name',)}),
        ('Permissions', {'fields': ('is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'user_name', 'first_name', 'password1', 'password2', 'is_active', 'is_staff')
            }
         ),
    )


admin.site.register(CustomUser, UserAdminConfig)
