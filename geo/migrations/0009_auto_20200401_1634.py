# Generated by Django 3.0.4 on 2020-04-01 16:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0008_auto_20200401_1633'),
    ]

    operations = [
        migrations.AlterField(
            model_name='regions',
            name='riskregion',
            field=models.BooleanField(default=False, null=True),
        ),
    ]
