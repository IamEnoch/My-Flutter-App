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

class AuthLoggedInState extends AuthState {
  final AuthUser user;

  const AuthLoggedInState(this.user);
}

class AuthLoggedInFailureState extends AuthState {
  final Exception exception;

  const AuthLoggedInFailureState(this.exception);
}

class AuthNeedVerirficationState extends AuthState {
  const AuthNeedVerirficationState();
}

class AuthLoggedOutState extends AuthState {
  const AuthLoggedOutState();
}

class AuthLoggedOutFailureState extends AuthState {
  final Exception exception;

  const AuthLoggedOutFailureState(this.exception);
}
