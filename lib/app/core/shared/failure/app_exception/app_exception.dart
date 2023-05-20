import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';

class AppException extends IAppException {
  AppException({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
