import 'package:bloc/bloc.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/auth/domain/repos/fire_store_repo.dart';
import 'package:meta/meta.dart';

part 'add_patient_data_state.dart';

class AddPatientDataCubit extends Cubit<AddPatientDataState> {
  AddPatientDataCubit(this.fireStoreRepo) : super(AddPatientDataInitial());
  final FireStoreRepo fireStoreRepo;

  Future<void> addPatientData(PatientEntity patientEntity) async {
    if (isClosed) return;

    emit(AddPatientDataLoading());

    final result = await fireStoreRepo.addPatientData(patientEntity);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddPatientDataFailure(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(AddPatientDataSuccess());
        }
      },
    );
  }
}
