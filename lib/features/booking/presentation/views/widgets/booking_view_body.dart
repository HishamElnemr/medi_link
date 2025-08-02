import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/booking_details.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/views/widgets/doctor_details.dart';
import 'package:medi_link/features/booking/presentation/views/widgets/select_date.dart';
import 'package:medi_link/features/booking/presentation/views/widgets/select_patient.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key});

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  bool isAnotherPatientSelected = true;
  DateTime? selectedDate;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorDetails(
                  doctorName: doctor.firstName + ' ' + doctor.lastName,
                  speciality: doctor.speciality,
                  age: doctor.age,
                ),
                const Divider(color: AppColors.primaryBlue, thickness: 2),
                const SizedBox(height: 13),
                Text(
                  S.of(context).patient_details,
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    SelectPatient(
                      text: S.of(context).myself,
                      onTap: () {
                        setState(() {
                          isAnotherPatientSelected = true;
                        });
                      },
                      isSelected: isAnotherPatientSelected,
                    ),
                    const SizedBox(width: 10),
                    SelectPatient(
                      text: S.of(context).other_person,
                      onTap: () {
                        setState(() {
                          isAnotherPatientSelected = false;
                        });
                      },
                      isSelected: !isAnotherPatientSelected,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (!isAnotherPatientSelected) ...[
                  CustomTextFormField(
                    controller: fullNameController, 
                    hitText: S.of(context).full_name,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: ageController,
                    hitText: S.of(context).age,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter age';
                      }
                      final age = int.tryParse(value);
                      if (age == null || age <= 0) {
                        return 'Please enter valid age';
                      }
                      return null;
                    },
                  ),
                ],
                if (isAnotherPatientSelected) ...[
                  BookingDetails(
                    title: S.of(context).full_name,
                    value:
                        getPatientData().firstName +
                        ' ' +
                        getPatientData().lastName,
                  ),
                  const SizedBox(height: 16),
                  BookingDetails(
                    title: S.of(context).age,
                    value: getPatientData().age.toString(),
                  ),
                  const SizedBox(height: 16),
                  BookingDetails(
                    title: S.of(context).email,
                    value: getPatientData().email,
                  ),
                ],
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
        child: SafeArea(
          child: CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (selectedDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select date and time'),
                    ),
                  );
                  return;
                }

                final String patientName = isAnotherPatientSelected
                    ? getPatientData().firstName +
                          ' ' +
                          getPatientData().lastName
                    : fullNameController.text.trim();

                final booking = BookingEntity(
                  id: '',
                  patientId: getPatientData().id,
                  doctorId: doctor.id,
                  patientName: patientName,
                  doctorName: doctor.firstName + ' ' + doctor.lastName,
                  date: selectedDate!.toIso8601String(),
                  status: 'pending',
                );

                context.read<BookingCubit>().addBooking(booking);
              }
            },
            text: S.of(context).book_now,
          ),
        ),
      ),
    );
  }
}
