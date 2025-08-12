import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

part 'get_doctor_by_speciality_state.dart';

class GetDoctorBySpecialityCubit extends Cubit<GetDoctorBySpecialityState> {
  GetDoctorBySpecialityCubit({required this.fireStoreRepoImpl})
    : super(GetDoctorBySpecialityInitial());

  final FireStoreRepoImpl fireStoreRepoImpl;

  Future<void> getDoctorsBySpeciality({required String specialization}) async {
    emit(GetDoctorBySpecialityLoading());

    final result = await fireStoreRepoImpl.getDoctorsBySpecialization(
      specialization: specialization,
    );
    result.fold(
      (failure) =>
          emit(GetDoctorBySpecialityFailure(errorMessage: failure.message)),
      (doctors) =>
          emit(GetDoctorBySpecialitySuccess(doctorsBySpeciality: doctors)),
    );
  }
}
