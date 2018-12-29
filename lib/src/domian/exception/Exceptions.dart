abstract class BaseException implements Exception {
  final String code;
  final String message;

  const BaseException(this.code, [this.message]);
}

class BadRequestException extends BaseException {
  const BadRequestException(String code, [String message]) : super(code, message);
}

class UnauthorizedException extends BaseException {
  const UnauthorizedException(String code, [String message]) : super(code, message);
}

class NotFoundException extends BaseException {
  const NotFoundException(String code, [String message]) : super(code, message);
}

class TimeOutException extends BaseException {
  const TimeOutException(String code, [String message]) : super(code, message);
}

class InternalErrorException extends BaseException {
  const InternalErrorException(String code, [String message]) : super(code, message);
}

class UnavailableException extends BaseException {
  const UnavailableException(String code, [String message]) : super(code, message);
}

class UnknownErrorException extends BaseException {
  const UnknownErrorException(String code, [String message]) : super(code, message);
}
