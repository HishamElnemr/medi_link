import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/booking_view/widgets/booking_button_sliver.dart';
import 'package:medi_link/features/patient_home/presentation/views/booking_view/widgets/booking_details_sliver.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key, required this.isLoading});
  final bool isLoading;
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
      return Center(
        child: Text(
          S.of(context).something_went_wrong + S.of(context).please_try_later,
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        BookingDetailsSliver(
          doctor: doctor,
          isAnotherPatientSelected: isAnotherPatientSelected,
          onSelectionChanged: (isMyself) {
            setState(() {
              isAnotherPatientSelected = isMyself;
            });
          },
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          ageController: ageController,
          formKey: _formKey,
          selectedDate: selectedDate,
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        BookingButtonSliver(
          isLoading: widget.isLoading,
          doctor: doctor,
          isAnotherPatientSelected: isAnotherPatientSelected,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          ageController: ageController,
          formKey: _formKey,
          selectedDate: selectedDate,
        ),
      ],
    );
  }
}
