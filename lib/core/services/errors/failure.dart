/// A failure returned to the presentation layer instead of a backend exception.
class Failure {
  const Failure({required this.message, this.code, this.statusCode});

  final String message;

  /// An error identifier, such as an Auth code or a Postgres SQLSTATE.
  final String? code;

  /// The HTTP status when it is supplied by the underlying exception.
  final int? statusCode;
}
