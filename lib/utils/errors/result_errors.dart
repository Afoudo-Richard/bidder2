class ErrorGettingProduct implements Exception {
  ErrorGettingProduct(String error);
}

class ErrorLoggingIn implements Exception {
  ErrorLoggingIn(String error);
}

class ErrorSigningIn implements Exception {
  ErrorSigningIn(this.error);
  final String error;
}

class ErrorEmptyResponse implements Exception {}