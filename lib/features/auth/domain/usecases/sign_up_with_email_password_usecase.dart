import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/error/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmailPasswordUsecase {
  final AuthRepository authRepository;
  SignUpWithEmailPasswordUsecase(this.authRepository);
  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return authRepository.signUpWithEmailPassword(
      email: email,
      password: password,
    );
  }
}
