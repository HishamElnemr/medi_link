import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/app_view.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/language_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/data/repos/fire_store_repo_imple.dart';
import 'features/auth/presentation/cubits/get_all_doctors/get_all_doctors_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Prefs.init();
  setup();
  runApp(const MediLink());
}

class MediLink extends StatelessWidget {
  const MediLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(
          create: (context) => GetAllDoctorsCubit(getIt<FireStoreRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              BookingCubit(bookingRepo: getIt<BookingRepoImpl>()),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return AppView(locale: locale);
        },
      ),
    );
  }
}
