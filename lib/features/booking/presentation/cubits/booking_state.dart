import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';

abstract class BookingState {
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {}

class BookingError extends BookingState {
  final Failure failure;

  BookingError(this.failure);
}

class DoctorBookingsLoaded extends BookingState {
  final List<BookingEntity> bookings;

  DoctorBookingsLoaded(this.bookings);
}