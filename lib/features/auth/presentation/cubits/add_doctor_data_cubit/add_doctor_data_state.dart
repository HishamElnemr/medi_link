part of 'add_doctor_data_cubit.dart';

@immutable
sealed class AddDoctorDataState {}

final class AddDoctorDataInitial extends AddDoctorDataState {}

final class AddDoctorDataLoading extends AddDoctorDataState {}

final class AddDoctorDataSuccess extends AddDoctorDataState {}

final class AddDoctorDataFailure extends AddDoctorDataState 
{
  final String message;
  AddDoctorDataFailure({required this.message});
}
