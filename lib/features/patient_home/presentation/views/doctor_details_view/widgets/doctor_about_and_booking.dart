import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorAboutAndBooking extends StatelessWidget {
  const DoctorAboutAndBooking({super.key, required this.args});

  final DoctorEntity args;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).about + ' ' + S.of(context).dr + ' ' + args.firstName,
          style: FontStyles.medium24.copyWith(color: AppColors.primaryBlue),
        ),
        const SizedBox(height: 12),
        Text(
          args.biography,
          style: FontStyles.light12.copyWith(
            color: AppColors.darkGrey,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: S.of(context).book_appointment,
          onPressed: () async{
            final result = await Navigator.pushNamed(
              context,
              RoutesName.booking,
              arguments: args,
            );
            if (result == true && context.mounted) {
              final patientId = getPatientData().id;
              context.read<BookingCubit>().getPatientBookings(patientId);
            }
          },
        ),
      ],
    );
  }
}
