import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';

class BookingModel {
  final String id;
  final String patientId;
  final String doctorId;
  final String patientName;
  final int patientAge;
  final String doctorName;
  final String date;
  final String status;

  BookingModel({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.status,
    required this.patientAge,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['id'],
    patientId: json['patientId'],
    doctorId: json['doctorId'],
    patientName: json['patientName'],
    doctorName: json['doctorName'],
    date: json['date'],
    status: json['status'],
    patientAge: json['patientAge'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'patientId': patientId,
    'doctorId': doctorId,
    'patientName': patientName,
    'doctorName': doctorName,
    'date': date,
    'status': status,
    'patientAge': patientAge,
  };

  BookingEntity toEntity() => BookingEntity(
    id: id,
    patientId: patientId,
    doctorId: doctorId,
    patientName: patientName,
    doctorName: doctorName,
    date: date,
    status: status,
    patientAge: patientAge,
  );

  factory BookingModel.fromEntity(BookingEntity entity) => BookingModel(
    id: entity.id,
    patientId: entity.patientId,
    doctorId: entity.doctorId,
    patientName: entity.patientName,
    doctorName: entity.doctorName,
    date: entity.date,
    status: entity.status,
    patientAge: entity.patientAge,
  );
}
