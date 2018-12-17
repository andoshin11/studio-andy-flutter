abstract class APIError {
  APIError({this.message, this.status, this.error});

  final String message;
  final int status;
  final Error error;
}
