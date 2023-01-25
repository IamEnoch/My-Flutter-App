import 'package:bloc/bloc.dart';
import 'package:flutterapp/services/auth/auth_provider.dart';
import 'package:flutterapp/services/auth/bloc/auth_event.dart';
import 'package:flutterapp/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //It should have an initial state
  AuthBloc(AuthProvider provider) : super(const AuthStateLoading()) {
    //Initializq
    on<AuthEventInitialize>(
      ((event, emit) async {
        await provider.initialize();
        final user = provider.currentUser;
        if (user == null) {
          emit(const AuthStateLoggedOut());
        } else if (!user.isEmailVerified) {
          emit(const AuthStateNeedVerirfication());
        } else {
          emit(AuthStateLoggedIn(user));
        }
      }),
    );

    //login event
    on<AuthEventLogin>(
      ((event, emit) async {
        emit(const AuthStateLoading());
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.logIn(
            email: email,
            password: password,
          );
          emit(AuthStateLoggedIn(user));
        } on Exception catch (e) {
          emit(AuthStateLoggedInFailure(e));
        }
      }),
    );

    //login
    on<AuthEventLogout>(
      ((event, emit) async {
        emit(const AuthStateLoading());
        try {
          emit(const AuthStateLoading());
          await provider.logOut();
          emit(const AuthStateLoggedOut());
        } on Exception catch (e) {
          emit(AuthStateLoggedOutFailure(e));
        }
      }),
    );
  }
}
