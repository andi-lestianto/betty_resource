class EndpointBaseUrl {
  // static const String baseUrl = 'https://api.betty.id';
  static const String baseUrl = 'http://36.90.208.138/dev/main-api';
  static const String apiUrl = '$baseUrl/api/v1/';

  // Images
  static const String imageUrl = '$baseUrl/api/v1/images/';

  // Session
  static const String sessions = 'sessions';
  static const String start = '$sessions/start';
  static const String recap = '$sessions/recap';
  static const String close = '$sessions/close';
  static const String actives = '$sessions/actives';

  // balances
  static const String balances = 'balances';
  static const String early = '$balances/early';
}
