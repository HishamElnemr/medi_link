import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

part 'get_doctors_state.dart';

class GetDoctorsCubit extends Cubit<GetDoctorsState> {
  GetDoctorsCubit({ required this.fireStoreRepoImpl}) : super(GetDoctorsInitial());

  final FireStoreRepoImpl fireStoreRepoImpl;

  Future<void> getDoctors() async {
    emit(GetDoctorsLoading());
    final result = await fireStoreRepoImpl.getDoctors();
    result.fold(
      (failure) => emit(GetDoctorsFailure(errorMessage: failure.message)),
      (doctors) => emit(GetDoctorsSuccess(doctors: doctors)),
    );
  }

}
