from django.db import models


class Author(models.Model):
    name = models.CharField(max_length=255)


class Book(models.Model):
    title = models.CharField(max_length=255)
    isbn = models.CharField(max_length=255)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, related_name='book')


class Hold(models.Model):
    date_placed = models.DateField()
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='hold')


class Patron(models.Model):
    name = models.CharField(max_length=255)
    card_number = models.IntegerField()
    email = models.CharField(max_length=255)


class Loan(models.Model):
    due_date = models.DateField()
    renewed = models.BooleanField()
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='loan')
    patron = models.ForeignKey(Patron, on_delete=models.CASCADE, related_name='loan')
