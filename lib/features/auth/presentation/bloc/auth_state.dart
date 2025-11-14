part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
  @Default('') String msg,
  @Default(false) bool isLoading,
   UserEntity?  userDetails,

  })= _AuthState;
}
