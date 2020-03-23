# Generated by Django 3.0.3 on 2020-03-23 15:33

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Reports',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('attachment_type', models.PositiveSmallIntegerField(choices=[(0, 'photo'), (1, 'video')])),
                ('path', models.CharField(max_length=255)),
                ('valide', models.BooleanField()),
            ],
        ),
    ]
