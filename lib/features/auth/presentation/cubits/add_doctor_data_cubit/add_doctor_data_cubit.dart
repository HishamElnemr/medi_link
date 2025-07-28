import 'package:bloc/bloc.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/repos/fire_store_repo.dart';
import 'package:meta/meta.dart';

part 'add_doctor_data_state.dart';

class AddDoctorDataCubit extends Cubit<AddDoctorDataState> {
  AddDoctorDataCubit(this.fireStoreRepo) : super(AddDoctorDataInitial());
  final FireStoreRepo fireStoreRepo;

  Future<void> addDoctorData(DoctorEntity doctorEntity) async {
    if (isClosed) return;

    emit(AddDoctorDataLoading());

    final result = await fireStoreRepo.addDoctorData(doctorEntity);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddDoctorDataFailure(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(AddDoctorDataSuccess());
        }
      },
    );
  }
}
