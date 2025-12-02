part of 'auth_bloc.dart';

enum ActionType{emailPasswordSignIn,emailPasswordSignUp,googleSignIn,signOut,none}
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
  @Default('') String msg,
  @Default(false) bool isLoading,
  @Default(false) bool isSuccess,
  @Default(ActionType.none) ActionType actionType,
   UserEntity?  userDetails,

  })= _AuthState;
}
