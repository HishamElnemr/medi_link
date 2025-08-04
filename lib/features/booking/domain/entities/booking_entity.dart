class BookingEntity {
  final String id;
  final String patientId;
  final String doctorId;
  final String patientName;
  final int patientAge;
  final String doctorName;
  final String date;
  final String status;

  BookingEntity( {
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.status,
    required this.patientAge,
  });
}
