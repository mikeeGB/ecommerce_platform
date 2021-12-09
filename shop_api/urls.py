from django.urls import path
from .views import ProductViewSet, ShopViewSet, ShopInfoViewSet, ProductsOfCurrentUser, ShopInfoOfCurrentUser
from .authentication.views import CustomUserCreate, BlacklistToken

urlpatterns = [
    # listing items
    path('shop_info/', ShopInfoViewSet.as_view({'get': 'list'})),
    path('products/', ProductViewSet.as_view({'get': 'list'})),
    path('shops/', ShopViewSet.as_view({'get': 'list'})),
    # retrieving single item
    path('shop_info/<int:pk>/', ShopInfoViewSet.as_view({'get': 'retrieve'})),
    path('products/<int:pk>/', ProductViewSet.as_view({'get': 'retrieve'})),
    path('shops/<int:pk>/', ShopViewSet.as_view({'get': 'retrieve'})),

    # listing of current users
    path('my_products/', ProductsOfCurrentUser.as_view()),
    path('my_shops/', ShopInfoOfCurrentUser.as_view()),

    # Creating, editing and deleting items
    # 1) ShopInfoViewSet
    path('admin/create/shop_info/', ShopInfoViewSet.as_view({'post': 'create'})),
    path('admin/edit/shop_info/<int:pk>/', ShopInfoViewSet.as_view({'put': 'update',
                                                                    'patch': 'partial_update'})),
    # deletes shop_info, related shop and all related products. Full delete
    path('admin/delete/shop_info/<int:pk>/', ShopInfoViewSet.as_view({'delete': 'destroy'})),

    # 2) ProductViewSet
    path('admin/create/product/', ProductViewSet.as_view({'post': 'create'})),
    path('admin/edit/product/<int:pk>/', ProductViewSet.as_view({'put': 'update',
                                                                 'patch': 'partial_update'})),
    # deletes product. Shop can store empty list of products if all prods were deleted
    path('admin/delete/product/<int:pk>/', ProductViewSet.as_view({'delete': 'destroy'})),

    # 3) ShopViewSet
    path('admin/create/shop/', ShopViewSet.as_view({'post': 'create'})),
    path('admin/edit/shop/<int:pk>/', ShopViewSet.as_view({'put': 'update',
                                                           'patch': 'partial_update'})),
    # deletes only shop
    path('admin/delete/shop/<int:pk>/', ShopViewSet.as_view({'delete': 'destroy'})),


    path('user/register/', CustomUserCreate.as_view(), name='create_user'),
    path('user/logout/blacklist/', BlacklistToken.as_view(), name='blacklist'),
]
