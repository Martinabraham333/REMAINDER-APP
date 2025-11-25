import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remainder_app/features/auth/data/datasource/auth_remote_datasource.dart';

import 'package:remainder_app/features/auth/data/repositorympl/auth_repositoryimpl.dart';
import 'package:remainder_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:remainder_app/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:remainder_app/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:remainder_app/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:remainder_app/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  sl.registerLazySingleton(()=>AuthRemoteDatasource(firebaseAuth: sl(), googleSignIn: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryimpl(sl()));
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => GoogleSigninUsecase(sl()));
  sl.registerLazySingleton(() => SignInWithEmailPasswordUsecase(sl()));
  sl.registerLazySingleton(() => SignUpWithEmailPasswordUsecase(sl()));
  sl.registerFactory(() => AuthBloc(sl(),sl(),sl()));
}
