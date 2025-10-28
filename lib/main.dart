import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/app_view.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/services/supabase_storage.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:medi_link/language_cubit.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.softBlue2,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SupabaseStorageServices.initSupabase();
  await SupabaseStorageServices.createBucket(
    BackendEndpoints.supabaseStorageName,
  );
  await Prefs.init();
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
        BlocProvider(create: (context) => FavoriteCubit()..loadFavorites()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return AppView(
            locale: Locale(
              Prefs.getString(BackendEndpoints.languageCode) ?? 'ar',
            ),
          );
        },
      ),
    );
  }
}
