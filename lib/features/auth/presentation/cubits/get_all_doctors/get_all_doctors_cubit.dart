import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entites/doctor_entity.dart';
import '../../../domain/repos/fire_store_repo.dart';
part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit(this.fireStoreRepo) : super(GetAllDoctorsInitial());
  final FireStoreRepo fireStoreRepo;

  Future<void> getAllDoctors() async {
    emit(GetAllDoctorsLoading());
    try {
      final result = await fireStoreRepo.getAllDoctors();
      result.fold(
        (failure) => emit(GetAllDoctorsFailure(message: failure.message)),
        (doctors) => emit(GetAllDoctorsSuccess(doctors: doctors)),
      );
    } catch (e) {
      emit(GetAllDoctorsFailure(message: e.toString()));
    }
  }

}
