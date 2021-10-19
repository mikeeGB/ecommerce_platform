from django.db import models
from django.contrib.auth.models import User


# Create your models here.
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


class Shop(models.Model):
    shop_name = models.CharField(max_length=50)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    products = models.ManyToManyField(Product)

    def __str__(self):
        return f"{self.user.username} - {self.shop_name}"


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    products = models.ManyToManyField(Product)
    total_quantity = models.PositiveIntegerField(default=0)
    final_price = models.DecimalField(max_digits=9, default=0, decimal_places=2)

    def __str__(self):
        return f"{self.id}"

    def save(self, *args, **kwargs):
        if self.id:
            self.final_price = sum([product_item.price for product_item in self.products.all()]) * self.total_quantity
        super().save(*args, **kwargs)

