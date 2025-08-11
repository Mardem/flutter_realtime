abstract class HttpResponseInterface<T> {
  T? data;
}

class HttpResponse<T> implements HttpResponseInterface<T> {
  @override
  T? data;
}
