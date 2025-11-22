import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

part 'update_doctor_data_state.dart';

class UpdateDoctorDataCubit extends Cubit<UpdateDoctorDataState> {
  UpdateDoctorDataCubit(this.fireStoreRepoImpl)
    : super(UpdateDoctorDataInitial());
  final FireStoreRepoImpl fireStoreRepoImpl;

  Future<void> updatePatientData(DoctorEntity doctorEntity, String uId) async {
    emit(UpdateDoctorDataLoading());
    var result = await fireStoreRepoImpl.updateDoctorData(
      doctorEntity,
      doctorEntity.id,
    );

    result.fold(
      (failure) {
        emit(UpdateDoctorDataFailure(failure.message));
      },
      (success) async {
        await fireStoreRepoImpl.getUserDataAndSaveRole(doctorEntity.id);
        emit(UpdateDoctorDataSuccess(doctorEntity));
      },
    );
  }
}
