import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_list_view.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../cubits/get_all_doctors/get_all_doctors_cubit.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
      builder: (context, state) {
        if (state is GetAllDoctorsSuccess) {
          return DoctorListView(doctors: state.doctors);
        } else if (state is GetAllDoctorsFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryBlue),
          );
        }
      },
    );
  }
}
