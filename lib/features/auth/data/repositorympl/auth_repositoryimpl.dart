import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:remainder_app/core/error/failure.dart';
import 'package:remainder_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryimpl extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryimpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDatasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return Left(ServerFailure(e.message ?? 'Server issue'));
    } on SocketException catch (e) {
      debugPrint(e.message);
      return Left(NetworkFailure('No Internet Connection'));
    } on TimeoutException catch (e) {
      debugPrint(e.message);
      return Left(CancelledFailure('Request Timed Out'));
    } catch (e) {
      debugPrint(e.toString());
      return Left(UnknownFailure('Sign in failed'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDatasource.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return Left(ServerFailure(e.message ?? 'Server issue'));
    } on SocketException catch (e) {
      debugPrint(e.message);
      return Left(NetworkFailure('No Internet Connection'));
    } on TimeoutException catch (e) {
      debugPrint(e.message);
      return Left(CancelledFailure('Request Timed Out'));
    } catch (e) {
      debugPrint(e.toString());
      return Left(UnknownFailure('Sign up failed'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final result = await authRemoteDatasource.signInWithGoogle();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);

      return Left(ServerFailure(e.message ?? 'Server issue'));
    } on SocketException catch (e) {
      debugPrint(e.message);
      return Left(NetworkFailure('No Internet Connection'));
    } on TimeoutException catch (e) {
      debugPrint(e.message);
      return Left(CancelledFailure('Request Timed Out'));
    } catch (e) {
      debugPrint(e.toString());
      return Left(UnknownFailure('Google Sign in failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await authRemoteDatasource.signOut();
      return Right(true);
    }
    on FirebaseAuthException catch (e) {
      debugPrint(e.message);

      return Left(ServerFailure(e.message ?? 'Server issue'));
    } on SocketException catch (e) {
      debugPrint(e.message);
      return Left(NetworkFailure('No Internet Connection'));
    } on TimeoutException catch (e) {
      debugPrint(e.message);
      return Left(CancelledFailure('Request Timed Out'));
    } catch (e) {
      debugPrint(e.toString());
      return Left(UnknownFailure('Sign Out failed'));
    }
  
  }
}
