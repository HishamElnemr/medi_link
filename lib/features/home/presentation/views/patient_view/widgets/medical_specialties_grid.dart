import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/home_specialty_localization.dart';
import 'package:medi_link/features/home/data/models/speciality_model.dart';
import 'package:medi_link/features/home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/specialty_card.dart';

class MedicalSpecialtiesGrid extends StatefulWidget {
  const MedicalSpecialtiesGrid({super.key});

  @override
  State<MedicalSpecialtiesGrid> createState() => _MedicalSpecialtiesGridState();
}

class _MedicalSpecialtiesGridState extends State<MedicalSpecialtiesGrid> {
  int selectedIndex = 0;
  Locale? _lastLocale;
  @override
  void initState() {
    super.initState();
    context.read<GetDoctorBySpecialityCubit>().getDoctorsBySpeciality(
      specialization: specialtiesList[0].rawName,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentLocale = Localizations.localeOf(context);
    if (_lastLocale != null && _lastLocale != currentLocale) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
    _lastLocale = currentLocale;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        key: ValueKey(Localizations.localeOf(context)),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: specialtiesList.length,
        itemBuilder: (context, index) {
          final speciality = specialtiesList[index];
          final isSelected = index == selectedIndex;
          return SpecialtyCard(
            icon: speciality.icon,
            title: getLocalizedSpecialtyTitle(context, speciality.titleKey),
            backgroundColor: isSelected ? Theme.of(context).primaryColor : null,
            iconColor: isSelected ? Colors.white : null,
            textColor: isSelected ? Colors.white : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
                context
                    .read<GetDoctorBySpecialityCubit>()
                    .getDoctorsBySpeciality(specialization: speciality.rawName);
              });
            },
          );
        },
      ),
    );
  }
}
