import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:remainder_app/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:remainder_app/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSigninUsecase usecaseGoogleSignin;
  final SignInWithEmailPasswordUsecase usecaseSignIn;
  final SignUpWithEmailPasswordUsecase usecaseSignUp;

  AuthBloc(this.usecaseGoogleSignin, this.usecaseSignIn, this.usecaseSignUp)
    : super(AuthState()) {
    on<SignInWithGoogle>(_signInWithGoogle);
    on<SignInWithEmailPassword>(_signInWithEmailPassword);
    on<SignUpWithEmailPassword>(_signUpWithEmailPassword);
  }
  _signInWithGoogle(SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, actionType: ActionType.googleSignIn));
    final result = await usecaseGoogleSignin.call();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            msg: failure.message,
            actionType: ActionType.googleSignIn,
            isSuccess: false,
          ),
        );
      },
      (result) {
        emit(
          state.copyWith(
            isLoading: false,
            userDetails: result,
            msg: 'Google sign-in completed successfully.',
            actionType: ActionType.googleSignIn,
            isSuccess: true,
          ),
        );
      },
    );
  }

  _signInWithEmailPassword(
    SignInWithEmailPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        actionType: ActionType.emailPasswordSignIn,
      ),
    );
    final result = await usecaseSignIn.call(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
     
        emit(
          state.copyWith(
            isLoading: false,
            msg: failure.message,
            actionType: ActionType.emailPasswordSignIn,
            isSuccess: false,
          ),
        );
      },
      (result) {
       
        emit(
          state.copyWith(
            isLoading: false,
            userDetails: result,
            msg: 'Signed in successfully',
            actionType: ActionType.emailPasswordSignIn,
            isSuccess: true,
          ),
        );
      },
    );
  }

  _signUpWithEmailPassword(
    SignUpWithEmailPassword event,
    Emitter<AuthState> emit,
  ) async {

    emit(
      state.copyWith(
        isLoading: true,
        actionType: ActionType.emailPasswordSignUp,
      ),
    );
    final result = await usecaseSignUp.call(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            msg: failure.message,
            actionType: ActionType.emailPasswordSignUp,
            isSuccess: false,
          ),
        );
      },
      (result) {
        emit(
          state.copyWith(
            isLoading: false,
            userDetails: result,
            msg: 'Signed up successfully',
            actionType: ActionType.emailPasswordSignUp,
            isSuccess: true,
          ),
        );
      },
    );
  }
}
