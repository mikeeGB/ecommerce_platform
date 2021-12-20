from ecommerce_platform.celery import app
from .email import send_register_email


@app.task
def send_email_task(name, email):
    return send_register_email(name, email)
