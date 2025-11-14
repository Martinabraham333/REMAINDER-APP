import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';


class GoogleSigninUsecase {
  final AuthRepository repository;
  GoogleSigninUsecase(this.repository);
  Future<Either<Failure, UserEntity>> call() {
    return repository.signInWithGoogle();
  }
}
