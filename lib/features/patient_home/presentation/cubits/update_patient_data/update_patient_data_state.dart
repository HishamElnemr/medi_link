part of 'update_patient_data_cubit.dart';

sealed class UpdatePatientDataState extends Equatable {
  const UpdatePatientDataState();

  @override
  List<Object> get props => [];
}

final class UpdatePatientDataInitial extends UpdatePatientDataState {}

final class UpdatePatientDataSuccess extends UpdatePatientDataState 
{
  final PatientEntity patientData;
  const UpdatePatientDataSuccess(this.patientData);
}

final class UpdatePatientDataFailure extends UpdatePatientDataState 
{
  final String message;
  const UpdatePatientDataFailure(this.message);
}

final class UpdatePatientDataLoading extends UpdatePatientDataState {}
