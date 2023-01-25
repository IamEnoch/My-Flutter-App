import 'package:flutter/foundation.dart' show immutable;
import 'package:flutterapp/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

//auth preocess loading state
class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn(this.user);
}

class AuthStateNeedVerirfication extends AuthState {
  const AuthStateNeedVerirfication();
}

class AuthStateLoggedOut extends AuthState {
  final Exception? exception;
  const AuthStateLoggedOut(this.exception);
}

class AuthStateLoggedOutFailure extends AuthState {
  final Exception exception;

  const AuthStateLoggedOutFailure(this.exception);
}
