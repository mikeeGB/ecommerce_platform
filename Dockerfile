FROM python:3.9-slim

COPY . /ecommerce_platform

WORKDIR /ecommerce_platform

RUN pip install -r requirements.txt
