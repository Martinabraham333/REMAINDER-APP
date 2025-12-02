import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/error/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure,UserEntity>> signUpWithEmailPassword({required String email,required String password});
  Future<Either<Failure,UserEntity>> signInWithEmailPassword({required String email,required String password});
  Future<Either<Failure,bool>> signOut();
}
