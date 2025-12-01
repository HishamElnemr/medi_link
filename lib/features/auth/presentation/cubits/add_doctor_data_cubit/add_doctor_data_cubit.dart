import 'package:bloc/bloc.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/repos/fire_store_repo.dart';
import 'package:medi_link/features/auth/domain/repos/images_repo.dart';
import 'package:meta/meta.dart';

part 'add_doctor_data_state.dart';

class AddDoctorDataCubit extends Cubit<AddDoctorDataState> {
  AddDoctorDataCubit(this.fireStoreRepo, this.imagesRepo)
    : super(AddDoctorDataInitial());
  final FireStoreRepo fireStoreRepo;
  final ImagesRepo imagesRepo;
  Future<void> addDoctorData(DoctorEntity doctorEntity) async {
    if (isClosed) {
      return;
    }

    emit(AddDoctorDataLoading());

    //final result = await fireStoreRepo.addDoctorData(doctorEntity);
    var result = await imagesRepo.uploadImage(doctorEntity.image);
    if (isClosed) {
      return;
    }

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddDoctorDataFailure(message: failure.message));
        }
      },
      (imageUrl) async {
        doctorEntity.imageUrl = imageUrl;

        final addData = await fireStoreRepo.addDoctorData(doctorEntity);
        addData.fold(
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
        if (!isClosed) {
          emit(AddDoctorDataSuccess());
        }
      },
    );
  }
}
