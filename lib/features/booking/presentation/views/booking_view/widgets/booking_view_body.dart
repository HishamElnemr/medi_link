import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/book_for_another_person_form.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/book_for_me_details.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/booking_type_selector.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/doctor_details.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/select_date.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key});

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  bool isAnotherPatientSelected = true;
  DateTime? selectedDate;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)?.settings.arguments as DoctorEntity?;

    if (doctor == null) {
      return const Center(child: Text('No doctor data received'));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  onSelectionChanged: (isMyself) {
                    setState(() {
                      isAnotherPatientSelected = isMyself;
                    });
                  },
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
                const SizedBox(height: 16),
                SelectDate(
                  initialDate: selectedDate,
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: bookingButton(context, doctor),
      ),
    );
  }

  SafeArea bookingButton(BuildContext context, DoctorEntity doctor) {
    return SafeArea(
      child: CustomButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
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
        },
        text: S.of(context).book_now,
      ),
    );
  }
}
