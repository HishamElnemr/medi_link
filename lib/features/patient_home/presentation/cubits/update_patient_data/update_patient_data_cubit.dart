import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';

part 'update_patient_data_state.dart';

class UpdatePatientDataCubit extends Cubit<UpdatePatientDataState> {
  UpdatePatientDataCubit(this.fireStoreRepoImpl)
    : super(UpdatePatientDataInitial());
  final FireStoreRepoImpl fireStoreRepoImpl;

  Future<void> updatePatientData(
    PatientEntity patientEntity,
    String uId,
  ) async {
    emit(UpdatePatientDataLoading());
    var result = await fireStoreRepoImpl.updatePatientData(
      patientEntity,
      patientEntity.id,
    );

    result.fold(
      (failure) {
        emit(UpdatePatientDataFailure(failure.message));
      },
      (success) async {
        await fireStoreRepoImpl.getUserDataAndSaveRole(patientEntity.id);
        emit(UpdatePatientDataSuccess(patientEntity));
      },
    );
  }
}
