import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/error/failure.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository authRepository;
  SignOutUsecase(this.authRepository);

  Future<Either<Failure, bool>> call() async {
    final result = await authRepository.signOut();
    return result;
  }
}
