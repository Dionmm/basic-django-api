from rest_framework import serializers
from monitor.models import Record


class RecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = Record
        fields = ['id', 'created']