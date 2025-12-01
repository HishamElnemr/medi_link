part of 'update_doctor_data_cubit.dart';

sealed class UpdateDoctorDataState  {
  const UpdateDoctorDataState();

}

class UpdateDoctorDataInitial extends UpdateDoctorDataState {}
class UpdateDoctorDataLoading extends UpdateDoctorDataState {}
class UpdateDoctorDataSuccess extends UpdateDoctorDataState {
  const UpdateDoctorDataSuccess();
}
class UpdateDoctorDataFailure extends UpdateDoctorDataState {
  final String message;
  const UpdateDoctorDataFailure(this.message);
}
