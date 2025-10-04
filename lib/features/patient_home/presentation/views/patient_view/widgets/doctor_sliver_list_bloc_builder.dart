import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/doctor_card_skeltonizer_loading.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_list_view_with_favorites.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../generated/l10n.dart';

class DoctorSliverListBlocBuilder extends StatelessWidget {
  const DoctorSliverListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorBySpecialityCubit, GetDoctorBySpecialityState>(
      builder: (context, state) {
        if (state is GetDoctorBySpecialitySuccess) {
          return state.doctorsBySpeciality.isEmpty
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      '${S.of(context).no_doctors_found} , ${S.of(context).please_try_later}',
                    ),
                  ),
                )
              : SliverToBoxAdapter(
                  child: DoctorListViewWithFavorites(
                    doctors: state.doctorsBySpeciality,
                  ),
                );
        } else if (state is GetDoctorBySpecialityFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Skeletonizer(child: DoctorCardSkeltonizerLoading()),
          );
        }
      },
    );
  }
}
