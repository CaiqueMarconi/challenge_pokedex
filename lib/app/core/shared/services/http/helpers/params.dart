enum HttpResponseType { json, bytes }

class GetHttpServiceParam {
  final String url;
  final HttpResponseType responseType;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? headers;
  final String? contentType;

  const GetHttpServiceParam({
    required this.url,
    this.data,
    this.headers,
    this.contentType,
    this.responseType = HttpResponseType.json,
  });
}
