abstract class CovidSummaryErrors implements Exception {
  String get message;
}

class UnknowError extends CovidSummaryErrors {
  @override
  final String message;

  UnknowError({this.message = 'Unknow error! Please report a issue.'});
}

class TimeoutError extends CovidSummaryErrors {
  @override
  final String message;

  TimeoutError(
      {this.message = 'Connection timeout. Please verify your connection!'});
}

class NoConnectionError extends CovidSummaryErrors {
  @override
  final String message;

  NoConnectionError(
      {this.message = 'No connection. Please turn on your internet!'});
}
