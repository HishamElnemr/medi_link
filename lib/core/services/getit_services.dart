import 'package:get_it/get_it.dart';
import 'package:medi_link/core/services/firebase_auth_services.dart';
import 'package:medi_link/features/auth/data/repos/auth_repo_imple.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
