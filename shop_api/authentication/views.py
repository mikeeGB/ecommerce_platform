from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import RegisterUserSerializer
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
# from shop_api.celery_config import tasks


class CustomUserCreate(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        registration_serializer = RegisterUserSerializer(data=request.data)
        if registration_serializer.is_valid():
            custom_user = registration_serializer.save()
            if custom_user:
                # tasks.send_email_task.delay(custom_user.user_name, custom_user.email)
                return Response(status=status.HTTP_201_CREATED)
        return Response(registration_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class BlacklistToken(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            refresh_token = request.data["refresh_token"]
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)
