from rest_framework import serializers
from shop_api.models import CustomUser
from shop_api.celery_config import tasks


class RegisterUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('email', 'user_name', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
            tasks.send_email_task.delay(instance.user_name, instance.email)
        instance.save()
        return instance
