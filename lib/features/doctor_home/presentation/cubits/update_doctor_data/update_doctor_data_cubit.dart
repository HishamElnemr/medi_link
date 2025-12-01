import 'package:bloc/bloc.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/data/repos/images_repo_impl.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

part 'update_doctor_data_state.dart';

class UpdateDoctorDataCubit extends Cubit<UpdateDoctorDataState> {
  UpdateDoctorDataCubit(this.fireStoreRepoImpl, this.imagesRepoImpl)
    : super(UpdateDoctorDataInitial());
  final FireStoreRepoImpl fireStoreRepoImpl;
  final ImagesRepoImpl imagesRepoImpl;
  Future<void> updateDoctorData(DoctorEntity doctorEntity, String uId) async {
    emit(UpdateDoctorDataLoading());

    if (doctorEntity.image != null && doctorEntity.image!.path.isNotEmpty) {
      var imgResult = await imagesRepoImpl.uploadImage(doctorEntity.image!);
      imgResult.fold(
        (failure) {
          emit(UpdateDoctorDataFailure(failure.message));
        },
        (imageUrl) async {
          doctorEntity.imageUrl = imageUrl; // حدث الـ URL الجديد
          var result = await fireStoreRepoImpl.updateDoctorData(
            doctorEntity,
            doctorEntity.id,
          );
          result.fold(
            (failure) {
              emit(UpdateDoctorDataFailure(failure.message));
            },
            (success) {
              emit(const UpdateDoctorDataSuccess());
            },
          );
        },
      );
    } else {
      // لو مفيش صورة جديدة، عدل البيانات بدون upload
      doctorEntity.imageUrl = getDoctorData().imageUrl;
      var result = await fireStoreRepoImpl.updateDoctorData(
        doctorEntity,
        doctorEntity.id,
      );
      result.fold(
        (failure) {
          emit(UpdateDoctorDataFailure(failure.message));
        },
        (success) {
          emit(const UpdateDoctorDataSuccess());
        },
      );
    }
  }

  Future<void> getDoctorsData(String uId) async {
    try {
      await fireStoreRepoImpl.getUserDataAndSaveRole(uId);
      emit(const UpdateDoctorDataSuccess());
    } catch (e) {
      emit(UpdateDoctorDataFailure(e.toString()));
    }
  }
}
