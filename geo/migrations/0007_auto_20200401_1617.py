# Generated by Django 3.0.4 on 2020-04-01 16:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0006_auto_20200401_1549'),
    ]

    operations = [
        migrations.AlterField(
            model_name='infectedregions',
            name='nb_confirmed',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='nb_death',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='nb_notyetsick',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='nb_recovered',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='nb_suspected',
            field=models.IntegerField(),
        ),
    ]
