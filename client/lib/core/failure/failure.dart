class AppFailure {
  final String message;
  AppFailure ([this.message = 'Sorry.. an error..!']);

  @override
  String toString() => 'AppFailure(message: $message)';
}
