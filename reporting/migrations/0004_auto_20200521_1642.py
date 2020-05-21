# Generated by Django 3.0.4 on 2020-05-21 16:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reporting', '0003_auto_20200521_1602'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reports',
            name='address',
            field=models.CharField(default='c', max_length=255),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='reports',
            name='attachment_type',
            field=models.CharField(choices=[('photo', 'photo'), ('video', 'video')], default='photo', max_length=5),
        ),
        migrations.AlterField(
            model_name='reports',
            name='symptoms',
            field=models.TextField(default='c'),
            preserve_default=False,
        ),
    ]