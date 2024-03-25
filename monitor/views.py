from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from monitor.models import Record
from monitor.serialisers import RecordSerializer


@csrf_exempt
def record_list(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        snippets = Record.objects.all()
        serializer = RecordSerializer(snippets, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        serializer = RecordSerializer(data={})
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
            
        return JsonResponse(serializer.errors, status=400)