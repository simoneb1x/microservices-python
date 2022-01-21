from rest_framework import serializers
from .models import Product

class ProductSerializer(seralizers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'