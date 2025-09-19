import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_list_view.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../../../../../core/constants/app_colors.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorBySpecialityCubit, GetDoctorBySpecialityState>(
      builder: (context, state) {
        if (state is GetDoctorBySpecialitySuccess) {
          return state.doctorsBySpeciality.isEmpty
              ? Center(
                  child: Text(
                    '${S.of(context).no_doctors_found} , ${S.of(context).please_try_later}',
                  ),
                )
              : DoctorListView(doctors: state.doctorsBySpeciality);
        } else if (state is GetDoctorBySpecialityFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryBlue),
          );
        }
      },
    );
  }
}
