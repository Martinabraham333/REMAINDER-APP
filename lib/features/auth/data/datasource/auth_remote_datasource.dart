import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remainder_app/core/error/failure.dart';

import 'package:remainder_app/features/auth/data/models/user_model.dart';

class AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore fireStore;

  AuthRemoteDatasource({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.fireStore,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      final query = await fireStore
          .collection('app_users')
          .where('email', isEqualTo: user!.email)
          .limit(1)
          .get();
      if (query.docs.isEmpty) {
        await fireStore.collection('app_users').add({
          'email': user.email,
          'phone': '',
          'full_name': '',
          'createdAt': DateTime.now(),
          'photo_url': '',
        });
      }
      return UserModel.fromFirebaseUser(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebaseUser(result.user);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Sign in cancelled');
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
        throw Exception('User not found');
      }

      final query = await fireStore
          .collection('app_users')
          .where('email', isEqualTo: user.email)
          .limit(1)
          .get();
      if (query.docs.isEmpty) {
        await fireStore.collection('app_users').add({
          'email': user.email,
          'phone': '',
          'full_name': '',
          'createdAt': DateTime.now(),
          'photo_url': '',
        });
      }
      return UserModel.fromFirebaseUser(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool>signOut() async {
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
