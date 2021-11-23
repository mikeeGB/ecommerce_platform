from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import RegisterUserSerializer
from rest_framework.permissions import AllowAny


class CustomUserCreate(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        registration_serializer = RegisterUserSerializer(data=request.data)
        if registration_serializer.is_valid():
            custom_user = registration_serializer.save()
            if custom_user:
                return Response(status=status.HTTP_201_CREATED)
        return Response(registration_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
