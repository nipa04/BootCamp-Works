from django.db import models


class Customer(models.Model):
    name = models.CharField(max_length=255)
    email = models.TextField()
    mail_address = models.TextField()

    def __str__(self):
        return self.name


class Order(models.Model):
    order_number = models.IntegerField()
    date = models.DateField()
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name='order')

    def __str__(self):
        return str(self.order_number)
