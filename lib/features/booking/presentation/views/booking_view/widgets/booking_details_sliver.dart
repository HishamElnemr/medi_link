import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/book_for_another_person_form.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/book_for_me_details.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/booking_type_selector.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/doctor_details.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/select_date.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingDetailsSliver extends StatelessWidget {
  final DoctorEntity doctor;
  final bool isAnotherPatientSelected;
  final Function(bool) onSelectionChanged;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController ageController;
  final GlobalKey<FormState> formKey;
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  const BookingDetailsSliver({
    super.key,
    required this.doctor,
    required this.isAnotherPatientSelected,
    required this.onSelectionChanged,
    required this.firstNameController,
    required this.lastNameController,
    required this.ageController,
    required this.formKey,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                DoctorDetails(
                  doctorName: '${doctor.firstName} ${doctor.lastName}',
                  speciality: AllSpecialtyUtils.getLocalizedSpecialty(
                    context,
                    doctor.speciality,
                  ),
                  age: doctor.age,
                ),
                const SizedBox(height: 13),
                const Divider(color: AppColors.primaryBlue, thickness: 2),
                const SizedBox(height: 13),
                Text(
                  S.of(context).patient_details,
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 13),
                BookingTypeSelector(
                  isMyselfSelected: isAnotherPatientSelected,
                  onSelectionChanged: onSelectionChanged,
                ),
                const SizedBox(height: 24),
                if (isAnotherPatientSelected)
                  const BookForMeDetails()
                else
                  BookForAnotherPersonForm(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    ageController: ageController,
                  ),
                const SizedBox(height: 13),
                const Divider(color: AppColors.primaryBlue, thickness: 2),
                const SizedBox(height: 13),
                SelectDate(
                  initialDate: selectedDate,
                  onDateSelected: onDateSelected,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
