
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/features/doctor_home/presentation/cubits/update_doctor_data/update_doctor_data_cubit.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_personal_information/widgets/edit_doctor_information_form.dart';
import 'package:medi_link/generated/l10n.dart';

class EditDoctorInformationFormBlocBuilder extends StatelessWidget {
  const EditDoctorInformationFormBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateDoctorDataCubit, UpdateDoctorDataState>(
      listener: (context, state) {
        if (state is UpdateDoctorDataFailure) {
          buildSnackBar(context, S.of(context).something_went_wrong);
          Navigator.pop(context);
          log(state.message);
        } else if (state is UpdateDoctorDataSuccess) {
          buildSnackBar(context, S.of(context).profile_updated_successfully);
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        return EditDoctorInformationForm(
          isLoading: state is UpdateDoctorDataLoading,
        );
      },
    );
  }
}
