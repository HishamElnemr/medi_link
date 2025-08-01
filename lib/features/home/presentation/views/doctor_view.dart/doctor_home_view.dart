import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/fire_store_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'dart:convert';

import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorData = Prefs.getString(BackendEndpoints.kDoctorData);
    log('Full doctor data: $doctorData');
    final doctorId = doctorData != null ? jsonDecode(doctorData)['id'] : '';
log('Doctor ID used: $doctorId');
    return BlocProvider(
      create: (_) => BookingCubit(
        bookingRepo: BookingRepoImpl(fireStoreServices: FireStoreServices()),
      )..getDoctorBookings(doctorId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          title: Text('My Bookings'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, RoutesName.login);
              },
            ),
          ],
        ),
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlue),
              );
            }
            if (state is BookingError) {
              return Center(child: Text('Error: ${state.failure.message}'));
            }
            if (state is DoctorBookingsLoaded) {
              final bookings = state.bookings;
              if (bookings.isEmpty) {
                return const Center(child: Text('No bookings available'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.softBlue2,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.lightGrey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking with ${booking.patientName}',
                                style: FontStyles.medium15.copyWith(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Date: ${booking.date.split('T')[0]}',
                                style: FontStyles.regular14.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              Text(
                                'Time: ${booking.time}',
                                style: FontStyles.regular14.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              Text(
                                'Status: ${booking.status}',
                                style: FontStyles.regular14.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('No bookings available'));
          },
        ),
      ),
    );
  }
}
