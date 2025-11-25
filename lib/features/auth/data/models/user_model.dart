import 'package:firebase_auth/firebase_auth.dart';
import 'package:remainder_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.userId,
    required super.email,
  });

  factory UserModel.fromFirebaseUser(User? user) {
    return UserModel(userName: user!.uid, userId: user.uid, email: user.email!);
  }
}
