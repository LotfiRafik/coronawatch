# Generated by Django 3.0.3 on 2020-03-23 22:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='thematicVideo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('date', models.DateField(auto_now_add=True)),
                ('path', models.CharField(max_length=255)),
                ('valide', models.BooleanField()),
                ('mobileuserid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='thematicvideos', to='users.MobileUser')),
                ('moderatorid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Moderator')),
            ],
        ),
        migrations.CreateModel(
            name='commentThematicVideo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField()),
                ('date', models.DateField(auto_now_add=True)),
                ('mobileuserid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.MobileUser')),
                ('thematicVideoid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='videosHomePage.thematicVideo')),
            ],
        ),
    ]
