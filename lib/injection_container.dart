import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:remainder_app/features/auth/data/repositorympl/auth_repositoryimpl.dart';
import 'package:remainder_app/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:remainder_app/features/auth/presentation/bloc/auth_bloc.dart';


final sl = GetIt.instance;

Future<void> initDependency() async {
  sl.registerLazySingleton(
    () => AuthRepositoryimpl(firebaseAuth: sl(), googleSignIn: sl()),
  );
  sl.registerLazySingleton(()=>FirebaseAuth.instance);
  sl.registerLazySingleton(()=>GoogleSignIn());
  sl.registerLazySingleton(()=>GoogleSigninUsecase(sl()));
  sl.registerFactory(()=>AuthBloc(sl()));
}
