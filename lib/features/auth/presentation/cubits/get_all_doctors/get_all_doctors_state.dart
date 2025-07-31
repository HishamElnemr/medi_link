part of 'get_all_doctors_cubit.dart';

@immutable
sealed class GetAllDoctorsState {}

final class GetAllDoctorsInitial extends GetAllDoctorsState {}

final class GetAllDoctorsLoading extends GetAllDoctorsState {}

final class GetAllDoctorsSuccess extends GetAllDoctorsState {
  final List<DoctorEntity> doctors;
  GetAllDoctorsSuccess({required this.doctors});
}

final class GetAllDoctorsFailure extends GetAllDoctorsState {
  final String message;
  GetAllDoctorsFailure({required this.message});
}
