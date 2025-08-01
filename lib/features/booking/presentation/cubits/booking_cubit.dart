import 'package:flutter_bloc/flutter_bloc.dart';
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
}
