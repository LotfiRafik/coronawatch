# Generated by Django 3.0.3 on 2020-03-20 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('health', '0002_remove_photoanalyze_path'),
    ]

    operations = [
        migrations.AddField(
            model_name='photoanalyze',
            name='path',
            field=models.CharField(default='a', max_length=255),
            preserve_default=False,
        ),
    ]
