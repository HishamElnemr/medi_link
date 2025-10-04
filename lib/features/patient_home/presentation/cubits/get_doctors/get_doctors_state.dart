part of 'get_doctors_cubit.dart';

sealed class GetDoctorsState extends Equatable {
  const GetDoctorsState();

  @override
  List<Object> get props => [];
}

final class GetDoctorsInitial extends GetDoctorsState {}

final class GetDoctorsSuccess extends GetDoctorsState {
  final List<DoctorEntity> doctors;
  const GetDoctorsSuccess({required this.doctors});
}

final class GetDoctorsFailure extends GetDoctorsState {
  final String errorMessage;
  const GetDoctorsFailure({required this.errorMessage});
}

final class GetDoctorsLoading extends GetDoctorsState {}
