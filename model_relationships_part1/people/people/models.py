from django.db import models


class Country(models.Model):
    name = models.CharField(max_length=255)
    year_founded = models.IntegerField()
    national_animal = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Province(models.Model):
    name = models.CharField(max_length=255)
    year_founded = models.IntegerField()
    country = models.ForeignKey(Country, on_delete=models.CASCADE, related_name='province')

    def __str__(self):
        return self.name


class City(models.Model):
    name = models.CharField(max_length=255)
    year_founded = models.IntegerField()
    province = models.ForeignKey(Province, on_delete=models.CASCADE, related_name='city')

    def __str__(self):
        return self.name


class Residence(models.Model):
    name = models.CharField(max_length=255)
    year_founded = models.IntegerField()
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name='residence')

    def __str__(self):
        return self.name

class Person(models.Model):
    name = models.CharField(max_length=255)
    year_founded = models.IntegerField()
    residence = models.ForeignKey(Residence, on_delete=models.CASCADE, related_name='person')

    def __str__(self):
        return self.name
