import 'package:get_it/get_it.dart';
import 'package:medi_link/core/services/firebase_auth_services.dart';
import 'package:medi_link/features/auth/data/repos/auth_repo_imple.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/patient_home/data/repos/booking_repo_impl.dart';

import 'fire_store_services.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  getIt.registerSingleton<FireStoreServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
  getIt.registerSingleton<BookingRepoImpl>(
    BookingRepoImpl(fireStoreServices: getIt<FireStoreServices>()),
  );
  getIt.registerSingleton<FireStoreRepoImpl>(
    FireStoreRepoImpl(fireStoreServices: getIt<FireStoreServices>()),
  );
}
