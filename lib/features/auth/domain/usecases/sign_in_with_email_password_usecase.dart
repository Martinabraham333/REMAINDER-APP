import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/error/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailPasswordUsecase {
  final AuthRepository authRepository;
  SignInWithEmailPasswordUsecase(this.authRepository);
  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return authRepository.signInWithEmailPassword(
      email: email,
      password: password,
    );
  }
}
