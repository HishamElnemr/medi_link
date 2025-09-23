import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingButtonSliver extends StatelessWidget {
  final DoctorEntity doctor;
  final bool isAnotherPatientSelected;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController ageController;
  final GlobalKey<FormState> formKey;
  final DateTime? selectedDate;
  final bool isLoading;

  const BookingButtonSliver({
    super.key,
    required this.doctor,
    required this.isAnotherPatientSelected,
    required this.firstNameController,
    required this.lastNameController,
    required this.ageController,
    required this.formKey,
    required this.selectedDate,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: CustomButton(
              isLoading: isLoading,
              onPressed: () {
                _onBookNowPressed(context);
              },
              text: S.of(context).book_now,
            ),
          ),
        ),
      ),
    );
  }

  void _onBookNowPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (selectedDate == null) {
        buildSnackBar(context, S.of(context).please_select_date);
        return;
      }

      final bool isBookingForSelf = isAnotherPatientSelected;

      final String patientName = isBookingForSelf
          ? '${getPatientData().firstName} ${getPatientData().lastName}'
          : '${firstNameController.text.trim()} ${lastNameController.text.trim()}';

      final int patientAge = isBookingForSelf
          ? getPatientData().age
          : int.parse(ageController.text.trim());

      final booking = BookingEntity(
        id: '',
        patientId: getPatientData().id,
        doctorId: doctor.id,
        patientName: patientName,
        doctorName: '${doctor.firstName} ${doctor.lastName}',
        date: selectedDate!.toIso8601String(),
        patientAge: patientAge,
        status: 'pending',
        doctorSpeciality: doctor.speciality,
      );

      context.read<BookingCubit>().addBooking(booking);
    }
  }
}
