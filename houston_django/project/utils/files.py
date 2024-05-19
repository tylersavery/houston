from io import BytesIO

from django.core.files.uploadedfile import InMemoryUploadedFile


def create_in_memory_file(data, filename):
    buffer = BytesIO()
    buffer.write(data)
    return InMemoryUploadedFile(buffer, None, filename, None, buffer.tell(), None)
