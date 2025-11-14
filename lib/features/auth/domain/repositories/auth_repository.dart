import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
   Future <Either<Failure,UserEntity>>signInWithGoogle();
}
