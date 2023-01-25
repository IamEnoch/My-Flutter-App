import 'package:flutter/foundation.dart' show immutable;
import 'package:flutterapp/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

//auth preocess loading state
class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn(this.user);
}

class AuthStateLoggedInFailure extends AuthState {
  final Exception exception;

  const AuthStateLoggedInFailure(this.exception);
}

class AuthStateNeedVerirfication extends AuthState {
  const AuthStateNeedVerirfication();
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLoggedOutFailure extends AuthState {
  final Exception exception;

  const AuthStateLoggedOutFailure(this.exception);
}
