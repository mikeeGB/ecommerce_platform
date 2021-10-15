from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class ShopType(models.Model):
    TYPE_CHOICES = (
        ('clothing', 'Clothing'),
        ('shoes', 'Shoes'),
        ('sport', 'Sport'),
    )
    type = models.CharField(choices=TYPE_CHOICES, max_length=20, default='clothing')

    def __str__(self):
        return self.type


class ProductCategory(models.Model):
    CATEGORIES = ShopType.TYPE_CHOICES
    category = models.CharField(choices=CATEGORIES, max_length=20, default='clothing')

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
    name = models.CharField(max_length=50)
    category = models.ForeignKey(ProductCategory, on_delete=models.CASCADE)
    description = models.TextField()
    image = models.ImageField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.PositiveIntegerField(default=0)
    size = models.CharField(max_length=4, choices=SIZES)
    color = models.CharField(choices=COLORS, max_length=20)

    def __str__(self):
        return self.name


class Shop(models.Model):
    shop_name = models.CharField(max_length=50)
    shop_type = models.ForeignKey(ShopType, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)

    def __str__(self):
        return f"{self.shop_name} {self.shop_type}"


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    products = models.ManyToManyField('CartProduct', blank=True)
    total_quantity = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f"{self.products.product}"

    def save(self, *args, **kwargs):
        if self.id:
            self.total_products = self.products.count()
            self.final_price = sum([product_item.final_price for product_item in self.products.all()])
        super().save(*args, **kwargs)


class CartProduct(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    cart_item = models.ForeignKey(Cart, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    final_price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.product.name

    def save(self, *args, **kwargs):
        self.final_price = self.quantity * self.product.price
        super().save(*args, **kwargs)
