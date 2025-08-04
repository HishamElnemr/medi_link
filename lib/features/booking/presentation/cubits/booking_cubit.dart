import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepoImpl bookingRepo;

  BookingCubit({required this.bookingRepo}) : super(BookingInitial());

  Future<void> addBooking(BookingEntity booking) async {
    emit(BookingLoading());
    final result = await bookingRepo.addBooking(booking);
    result.fold(
      (failure) => emit(BookingError(failure)),
      (_) => emit(BookingSuccess()),
    );
  }

  Future<void> getDoctorBookings(String doctorId) async {
    emit(BookingLoading());
    final result = await bookingRepo.getDoctorBookings(doctorId);
    result.fold(
      (failure) => emit(BookingError(failure)),
      (bookings) => emit(DoctorBookingsLoaded(bookings)),
    );
  }

  Future<void> getPatientBookings(String patientId) async {
    emit(BookingLoading());
    final result = await bookingRepo.getPatientBookings(patientId);
    result.fold(
      (failure) => emit(BookingError(failure)),
      (bookings) => emit(PatientBookingsLoaded(bookings)),
    );
  }

  Future<void> updateBookingStatus(String bookingId, String newStatus) async {
    final result = await bookingRepo.updateBookingStatus(bookingId, newStatus);
    result.fold(
      (failure) => emit(BookingError(failure)),
      (_) async {
        final doctorData = await getDoctorData();

        if (doctorData.id != null) {
          await getDoctorBookings(doctorData.id!);();
        }}
    );
  }

  Future<void> approveBooking(String bookingId) async {
    await updateBookingStatus(bookingId, 'approved');
  }

  Future<void> rejectBooking(String bookingId) async {
    await updateBookingStatus(bookingId, 'rejected');
  }

  Future<void> cancelBooking(String bookingId) async {
    await updateBookingStatus(bookingId, 'cancelled');
  }

  Future<void> completeBooking(String bookingId) async {
    await updateBookingStatus(bookingId, 'completed');
  }
}
