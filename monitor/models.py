from django.db import models

class Record(models.Model):
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['created']