import 'package:dio/dio.dart';

import 'helpers/params.dart';
import 'helpers/responses.dart';
import 'i_http_service.dart';

class DioHttpService implements IHttpService {
  final Dio _dio;

  const DioHttpService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param) async {
    final dioResponse = await _dio.get<T>(
      param.url,
      queryParameters: param.data,
      options: Options(
        responseType: _handleResponseType(param.responseType),
        headers: param.headers,
        contentType: param.contentType,
      ),
    );

    final response = GetHttpServiceResponse(data: dioResponse.data);
    return response;
  }

  ResponseType _handleResponseType(HttpResponseType responseType) {
    switch (responseType) {
      case HttpResponseType.json:
        return ResponseType.json;
      case HttpResponseType.bytes:
        return ResponseType.bytes;
    }
  }

  // @override
  // Future<PostHttpServiceResponse<T>> post<T>(PostHttpServiceParam param) async {
  //   final dioResponse = await _dio.post<T>(
  //     param.url,
  //     data: param.data,
  //     queryParameters: param.params,
  //     options: Options(
  //       responseType: _handleResponseType(param.responseType),
  //       headers: param.headers,
  //       contentType: param.contentType,
  //     ),
  //   );

  //   final response = PostHttpServiceResponse(data: dioResponse.data);
  //   return response;
  // }

}
