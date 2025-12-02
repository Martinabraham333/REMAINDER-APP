part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithGoogle() = SignInWithGoogle;
  const factory AuthEvent.signInWithEmailPassword({
    required String email,
    required String password,
  }) = SignInWithEmailPassword;
  const factory AuthEvent.signUpWithEmailPassword({
    required String email,
    required String password,
  }) = SignUpWithEmailPassword;
  const factory AuthEvent.signOut() = SignOut;
}
