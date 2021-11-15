from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from .managers import CustomAccountManager


class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_('email address'), unique=True)
    user_name = models.CharField(max_length=150, unique=True)
    first_name = models.CharField(_('first name'), max_length=30, blank=True)
    date_joined = models.DateTimeField(_('date joined'), auto_now_add=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    objects = CustomAccountManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['user_name', 'first_name']

    def __str__(self):
        return self.user_name


class ProductCategory(models.Model):
    CATEGORY_CHOICES = (
        ('clothing', 'Clothing'),
        ('shoes', 'Shoes'),
        ('sport', 'Sport'),
    )
    category = models.CharField(choices=CATEGORY_CHOICES, max_length=20, default='clothing')

    def __str__(self):
        return self.category


class Product(models.Model):
    SIZES = (
        ('xs', 'XS'),
        ('s', 'S'),
        ('m', 'M'),
        ('l', 'L'),
        ('xl', 'XL'),
        ('xxl', 'XXL'),
    )
    COLORS = (
        ('black', 'Black'),
        ('white', 'White'),
        ('yellow', 'Yellow'),
        ('green', 'Green'),
        ('red', 'Red'),
        ('orange', 'Orange'),
    )
    creator = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    shop_inf = models.ForeignKey('ShopInfo', on_delete=models.CASCADE)
    title = models.CharField(max_length=50)
    category = models.ForeignKey(ProductCategory, on_delete=models.CASCADE)
    description = models.TextField()
    image = models.ImageField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.PositiveIntegerField(default=0)
    size = models.CharField(max_length=4, choices=SIZES)
    color = models.CharField(choices=COLORS, max_length=20)

    def __str__(self):
        return self.title


class ShopInfo(models.Model):
    shop_name = models.CharField(max_length=50, unique=True)
    owner = models.ForeignKey(CustomUser, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.shop_name} - {self.owner}"


class Shop(models.Model):
    shop_info = models.ForeignKey(ShopInfo, on_delete=models.CASCADE)
    products = models.ManyToManyField(Product)

    def __str__(self):
        return f"{self.shop_info}"
