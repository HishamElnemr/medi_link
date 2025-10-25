import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/update_patient_data/update_patient_data_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/edit_patient_information_form.dart';
import 'package:medi_link/generated/l10n.dart';

class EditPatientInformationFormBlocBuilder extends StatelessWidget {
  const EditPatientInformationFormBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePatientDataCubit, UpdatePatientDataState>(
      listener: (context, state) {
        if (state is UpdatePatientDataFailure) {
          buildSnackBar(context, S.of(context).something_went_wrong);
          Navigator.pop(context);
        } else if (state is UpdatePatientDataSuccess) {
          buildSnackBar(context, S.of(context).profile_updated_successfully);
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        return EditPatientInformationForm(
          isLoading: state is UpdatePatientDataLoading,
        );
      },
    );
  }
}
