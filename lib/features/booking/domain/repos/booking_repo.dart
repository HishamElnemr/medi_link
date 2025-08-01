import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';

abstract class BookingRepo {
  Future<Either<Failure, void>> addBooking(BookingEntity booking);
  Future<Either<Failure, List<BookingEntity>>> getDoctorBookings(
    String doctorId,
  );
}
