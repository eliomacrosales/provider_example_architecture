class ResponseApi {
  final int statusCode;
  final dynamic data;

  ResponseApi(
      {required this.statusCode, this.data = const {}});
  @override
  String toString() {
    return 'statusCode=$statusCode\ndata=$data';
  }
}

