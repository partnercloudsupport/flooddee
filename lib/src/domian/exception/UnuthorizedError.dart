import 'package:flutter_foodonline/src/domian/exception/Exceptions.dart';

class UnauthorizedError {
  static const NOT_AUTHORIZED_USER =
      UnauthorizedException("40101", "User is not authorized");
}
