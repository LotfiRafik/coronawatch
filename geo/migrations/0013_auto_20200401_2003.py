# Generated by Django 3.0.4 on 2020-04-01 20:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0012_auto_20200401_1940'),
    ]

    operations = [
        migrations.AlterField(
            model_name='infectedregions',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
    ]
