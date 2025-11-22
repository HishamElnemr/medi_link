part of 'update_doctor_data_cubit.dart';

sealed class UpdateDoctorDataState extends Equatable {
  const UpdateDoctorDataState();

  @override
  List<Object> get props => [];
}

class UpdateDoctorDataInitial extends UpdateDoctorDataState {}
class UpdateDoctorDataLoading extends UpdateDoctorDataState {}
class UpdateDoctorDataSuccess extends UpdateDoctorDataState {
  final DoctorEntity doctorEntity;
  const UpdateDoctorDataSuccess(this.doctorEntity);
}
class UpdateDoctorDataFailure extends UpdateDoctorDataState {
  final String message;
  const UpdateDoctorDataFailure(this.message);
}
