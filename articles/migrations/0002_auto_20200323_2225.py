# Generated by Django 3.0.3 on 2020-03-23 22:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('articles', '0001_initial'),
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='commentarticle',
            name='mobileuserid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='comments', to='users.MobileUser'),
        ),
        migrations.AddField(
            model_name='attachmentarticle',
            name='articleid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attachments', to='articles.Article'),
        ),
        migrations.AddField(
            model_name='article',
            name='moderatorid',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='users.Moderator'),
        ),
        migrations.AddField(
            model_name='article',
            name='redactor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='articles', to='users.Redactor'),
        ),
    ]
