# Generated by Django 2.1.7 on 2019-03-18 21:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crowdfunder', '0006_auto_20190318_1943'),
    ]

    operations = [
        migrations.AlterField(
            model_name='backer',
            name='amount_given',
            field=models.IntegerField(),
        ),
    ]