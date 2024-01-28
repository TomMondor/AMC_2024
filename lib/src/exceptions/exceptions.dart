class ApiException implements Exception {
  final int? errorCode;
  final dynamic data;
  const ApiException({this.errorCode, required this.data});
}

class AuthenticationException implements Exception {
  final String message;
  const AuthenticationException({required this.message});
}

class UserException implements Exception {
  final String message;
  const UserException({required this.message});
}

class FirestoreException implements Exception {
  final String message;
  const FirestoreException({required this.message});
}
