import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/usecases/google_signin_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSigninUsecase usecase;

  AuthBloc(this.usecase) : super(AuthState()) {
    on<SignInWithGoogle>(_signInWithGoogle);
  }
  _signInWithGoogle(SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await usecase.call();
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, msg: failure.message));
      },
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            userDetails: data,
            msg: 'Sign In Successful',
          ),
        );
      },
    );
  }
}
