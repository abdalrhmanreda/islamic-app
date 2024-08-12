class ApiConstant {
  static const String baseUrl = "https://quranenc.com/api/v1/";
  static const String translation = "translation/sura/arabic_moyassar/";
  static const String login = "auth/login";
  static const String signup = "register";
  static const String googleMapApiKey =
      'AIzaSyDhDTdS1TbmYZKTAts3xY1YPOEWmvrR4ls';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
