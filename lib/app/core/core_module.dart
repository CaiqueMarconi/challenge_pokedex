import 'package:challenge_pokedex/app/core/shared/http/dio_http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        // HttpService
        Bind.lazySingleton((i) => Dio(), export: true),
        Bind.lazySingleton((i) => DioHttpService(dio: i()), export: true),
      ];
}
