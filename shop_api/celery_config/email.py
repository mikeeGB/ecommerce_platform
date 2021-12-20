from django.core.mail import EmailMessage
from django.conf import settings


def send_register_email(name, email):
    email_subject = "Thanks for the registration on our platform!"
    email_body = f"Hey, {name}:) Your email for logging in is {email}\nThank you for registration!" \
                 f"\nVisit admin panel to create your own products"

    email_message = EmailMessage(
        email_subject, email_body,
        settings.DEFAULT_FROM_EMAIL, [email, ],
    )
    return email_message.send(fail_silently=False)
