part of 'add_patient_data_cubit.dart';

@immutable
sealed class AddPatientDataState {}

final class AddPatientDataInitial extends AddPatientDataState {}

final class AddPatientDataLoading extends AddPatientDataState {}

final class AddPatientDataSuccess extends AddPatientDataState {}

final class AddPatientDataFailure extends AddPatientDataState {
  final String message;
  AddPatientDataFailure({required this.message});
}
