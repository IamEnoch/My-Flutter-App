//login auth exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//Register auth exceptions
class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
