import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/core/services/fire_store_services.dart';
import 'package:medi_link/features/booking/data/models/booking_model.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/domain/repos/booking_repo.dart';

class BookingRepoImpl implements BookingRepo {
  final FireStoreServices fireStoreServices;

  BookingRepoImpl({required this.fireStoreServices});

  @override
  Future<Either<Failure, void>> addBooking(BookingEntity booking) async {
    try {
      await fireStoreServices.addBookingData(
        data: BookingModel.fromEntity(booking).toJson(),
      );
      log('Booking added successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error adding booking: $e');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getDoctorBookings(
    String doctorId,
  ) async {
    try {
      var result = await fireStoreServices.getDoctorBookings(doctorId);
      return Right(
        result.map((e) => BookingModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log('Error getting doctor bookings: $e');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getPatientBookings(
    String patientId,
  ) async {
    try {
      var result = await fireStoreServices.getPatientBookings(patientId);
      return Right(
        result.map((e) => BookingModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log('Error getting patient bookings: $e');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> updateBookingStatus(
    String bookingId,
    String newStatus,
  ) async {
    try {
      await fireStoreServices.updateBookingStatus(bookingId, newStatus);
      log('Booking status updated successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error updating booking status: $e');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBooking(String bookingId) async {
    try {
      fireStoreServices.deleteBooking(bookingId);
      log('Booking deleted successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error deleting booking: $e');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة مرة أخرى'));
    }
  }
}
