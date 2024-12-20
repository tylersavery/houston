# Generated by Django 5.0.6 on 2024-05-21 19:48

import django.contrib.postgres.fields
import django.db.models.deletion
import project.utils.uuid
import project.validators
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uuid', models.UUIDField(db_index=True, default=project.utils.uuid.get_uuid, editable=False, unique=True, verbose_name='UUID')),
                ('metadata', models.JSONField(blank=True, default=dict, null=True, validators=[project.validators.TypeValidator(dict)], verbose_name='Metadata')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated At')),
                ('title', models.CharField(max_length=100, verbose_name='Title')),
                ('year', models.IntegerField(verbose_name='Year')),
                ('image_url', models.URLField(verbose_name='Image Url')),
            ],
            options={
                'verbose_name': 'Movie',
                'verbose_name_plural': 'Movies',
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uuid', models.UUIDField(db_index=True, default=project.utils.uuid.get_uuid, editable=False, unique=True, verbose_name='UUID')),
                ('metadata', models.JSONField(blank=True, default=dict, null=True, validators=[project.validators.TypeValidator(dict)], verbose_name='Metadata')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated At')),
                ('title', models.CharField(max_length=128, verbose_name='Title')),
                ('body', models.TextField(blank=True, null=True)),
                ('assets', django.contrib.postgres.fields.ArrayField(base_field=models.URLField(max_length=256), blank=True, default=list, size=None, verbose_name='Assets')),
                ('is_deleted', models.BooleanField(default=False, verbose_name='Deleted')),
                ('is_unlisted', models.BooleanField(default=False, verbose_name='Unlisted')),
                ('is_published', models.BooleanField(default=False, verbose_name='Published')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='posts', to=settings.AUTH_USER_MODEL, verbose_name='Owner')),
            ],
            options={
                'verbose_name': 'Post',
                'verbose_name_plural': 'Posts',
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uuid', models.UUIDField(db_index=True, default=project.utils.uuid.get_uuid, editable=False, unique=True, verbose_name='UUID')),
                ('metadata', models.JSONField(blank=True, default=dict, null=True, validators=[project.validators.TypeValidator(dict)], verbose_name='Metadata')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated At')),
                ('body', models.TextField(verbose_name='Body')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Owner')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='children', to='content.comment', verbose_name='Parent')),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='content.post', verbose_name='Post')),
            ],
            options={
                'verbose_name': 'Comment',
                'verbose_name_plural': 'Comments',
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
    ]
