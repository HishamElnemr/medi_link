import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/doctor_card_skeltonizer_loading.dart';
import 'package:medi_link/features/home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_list_view.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorListViewBuilder extends StatelessWidget {
  const DoctorListViewBuilder({super.key});

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
          return const Skeletonizer(child: DoctorCardSkeltonizerLoading());
        }
      },
    );
  }
}
