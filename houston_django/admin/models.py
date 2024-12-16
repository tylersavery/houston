from django.contrib import admin

from admin.mixins import AddFieldsetsMixin, OverridesMixin


class StackedInline(OverridesMixin, admin.StackedInline):
    class Media:
        pass


class ModelAdmin(AddFieldsetsMixin, OverridesMixin, admin.ModelAdmin):
    save_on_top = True

    class Media:
        pass
