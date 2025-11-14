import 'package:dartz/dartz.dart';
import 'package:remainder_app/core/failure.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryimpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  AuthRepositoryimpl({required this.firebaseAuth, required this.googleSignIn});
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(CancelledFailure('Sign in cancelled'));
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user == null) {
        return Left(Failure('User not found'));
      }
      final userEntity = UserEntity(
        userName: user.displayName!,
        userId: user.uid,
        email: user.email!,
      );
      return Right(userEntity);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
