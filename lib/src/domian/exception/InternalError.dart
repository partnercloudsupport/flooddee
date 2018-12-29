import 'package:flutter_foodonline/src/domian/exception/Exceptions.dart';

class InternalError {
  static const UNABLE_CREATE_USER =
      InternalErrorException("50001", "Unable to create user");
  static const UNABLE_CREATE_PRODUCT =
      InternalErrorException("50002", "Unable to create product");
  static const UNABLE_CREATE_ORDER =
      InternalErrorException("50003", "Unable to create order");

  static const UNABLE_GET_USER =
      InternalErrorException("50101", "Unable to get user");
  static const UNABLE_GET_PRODUCT =
      InternalErrorException("50102", "Unable to get product");
  static const UNABLE_GET_ORDER =
      InternalErrorException("50103", "Unable to get product");
  static const UNABLE_GET_PRODUCT_STOCK =
      InternalErrorException("50104", "Unable to get product stock");
  static const UNABLE_GET_TRANSACTION =
      InternalErrorException("50105", "Unable to get transactions");

  static const UNABLE_SAVE_PRODUCT_STOCK =
      InternalErrorException("50201", "Unable to save product stock");
  static const UNABLE_SAVE_PAYMENT =
      InternalErrorException("50202", "Unable to save payment");

  static const UNABLE_CHARGE_CREDIT_CARD =
      InternalErrorException("50301", "Unable to charge credit card");
  static const UNABLE_REFUND =
      InternalErrorException("50302", "Unable to refund");
  static const UNABLE_SIGN_IN =
      InternalErrorException("50303", "Unable to sign in");
  static const UNABLE_SIGN_UP =
      InternalErrorException("50304", "Unable to sign up");
  static const UNABLE_SIGN_OUT =
      InternalErrorException("50305", "Unable to sign out");
  static const UNABLE_SEND_FORGOT_PWD_VERIFICATION_CODE =
      InternalErrorException(
          "50306", "Unable to send forgot password verification code");
  static const UNABLE_SET_NEW_PASSWORD =
      InternalErrorException("50307", "Unable to set new password");
  static const UNABLE_GET_USER_DETAIL =
      InternalErrorException("50308", "Unable to get user detail");
}
