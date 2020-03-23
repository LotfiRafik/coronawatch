# Generated by Django 3.0.3 on 2020-03-23 15:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Countries',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Regions',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('region_name', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10)),
                ('latitude', models.DecimalField(blank=True, decimal_places=8, max_digits=10, null=True)),
                ('longitude', models.DecimalField(blank=True, decimal_places=8, max_digits=11, null=True)),
                ('riskvalide', models.BooleanField()),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='geo.Countries')),
                ('riskagentid', models.ForeignKey(blank=True, db_column='riskagentid', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Agent')),
                ('riskmoderatorid', models.ForeignKey(blank=True, db_column='riskmoderatorid', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Moderator')),
            ],
        ),
        migrations.CreateModel(
            name='receptionCenter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('adress', models.CharField(max_length=255)),
                ('regionid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='geo.Regions')),
            ],
        ),
        migrations.CreateModel(
            name='infectedRegions',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nb_death', models.IntegerField(default=0)),
                ('nb_recovered', models.IntegerField(default=0)),
                ('date', models.DateField(auto_now_add=True)),
                ('valide', models.BooleanField()),
                ('agentid', models.ForeignKey(blank=True, db_column='riskagentid', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Agent')),
                ('moderatorid', models.ForeignKey(blank=True, db_column='riskmoderatorid', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Moderator')),
                ('regionid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='geo.Regions')),
            ],
        ),
    ]
