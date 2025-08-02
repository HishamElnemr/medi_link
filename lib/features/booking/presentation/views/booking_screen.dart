import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/services/fire_store_services.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';

class BookingScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;

  const BookingScreen({
    required this.doctorId,
    required this.doctorName,
    super.key,
  });

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _auth = FirebaseAuth.instance;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(
        bookingRepo: BookingRepoImpl(
          fireStoreServices: getIt<FireStoreServices>(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('Book with ${widget.doctorName}')),
        body: BlocListener<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is BookingSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking successful!')),
              );
              Navigator.pop(context);
            } else if (state is BookingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.failure.message}')),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : 'Date: ${selectedDate!.toLocal().toString().split(' ')[0]}',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(
                    selectedTime == null
                        ? 'Select Time'
                        : 'Time: ${selectedTime!.format(context)}',
                  ),
                ),
                const SizedBox(height: 32),
                BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is BookingLoading
                          ? null
                          : () {
                              if (selectedDate == null ||
                                  selectedTime == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please select date and time',
                                    ),
                                  ),
                                );
                                return;
                              }
                              final booking = BookingEntity(
                                id: '',
                                patientId: _auth.currentUser!.uid,
                                doctorId: widget.doctorId,
                                patientName:
                                    getPatientData().firstName +
                                    ' ' +
                                    getPatientData().lastName,
                                doctorName: widget.doctorName,
                                date: selectedDate!.toIso8601String(),
                                status: 'pending',
                              );
                              context.read<BookingCubit>().addBooking(booking);
                            },
                      child: state is BookingLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Confirm Booking'),
                    );
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
