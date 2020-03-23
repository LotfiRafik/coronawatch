# Generated by Django 3.0.3 on 2020-03-23 16:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='commentRobotsContent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField()),
                ('date', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='RobotsContent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('source_type', models.PositiveSmallIntegerField(choices=[(0, 'FACEBOOK'), (1, 'YOUTUBE'), (2, 'WEB')])),
                ('url', models.CharField(max_length=255)),
                ('date', models.DateField()),
                ('valide', models.BooleanField()),
            ],
        ),
    ]
