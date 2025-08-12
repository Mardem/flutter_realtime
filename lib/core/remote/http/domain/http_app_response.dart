class AppResponse<T> {
  AppResponse({
    required this.success,
    this.messageError,
    this.data,
  });

  final String? messageError;
  final bool success;
  T? data;
}
