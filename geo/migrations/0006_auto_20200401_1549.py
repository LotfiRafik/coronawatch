# Generated by Django 3.0.4 on 2020-04-01 15:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
        ('geo', '0005_auto_20200401_1542'),
    ]

    operations = [
        migrations.AddField(
            model_name='regions',
            name='riskregion',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='agentid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='users.Agent'),
        ),
        migrations.AlterField(
            model_name='infectedregions',
            name='regionid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='geo.Regions'),
        ),
    ]
