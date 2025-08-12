part of 'get_doctor_by_speciality_cubit.dart';

sealed class GetDoctorBySpecialityState extends Equatable {
  const GetDoctorBySpecialityState();

  @override
  List<Object> get props => [];
}

final class GetDoctorBySpecialityInitial extends GetDoctorBySpecialityState {}

final class GetDoctorBySpecialityLoading extends GetDoctorBySpecialityState {}

final class GetDoctorBySpecialitySuccess extends GetDoctorBySpecialityState {
  final List<DoctorEntity> doctorsBySpeciality;
  const GetDoctorBySpecialitySuccess({required this.doctorsBySpeciality});
}

final class GetDoctorBySpecialityFailure extends GetDoctorBySpecialityState {
  final String errorMessage;
  const GetDoctorBySpecialityFailure({required this.errorMessage});
}
