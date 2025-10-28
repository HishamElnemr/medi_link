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
    print('🔥 AddDoctorData Started: Doctor ID = ${doctorEntity.id}');
    if (isClosed) {
      print('⚠️ Cubit closed, skipping addDoctorData');
      return;
    }

    emit(AddDoctorDataLoading());
    print('📤 Loading state emitted');

    //final result = await fireStoreRepo.addDoctorData(doctorEntity);
    print('🖼️ Uploading image...');
    var result = await imagesRepo.uploadImage(doctorEntity.image);
    if (isClosed) {
      print('⚠️ Cubit closed during image upload');
      return;
    }

    result.fold(
      (failure) {
        print('❌ Image Upload Failure: ${failure.message}');
        if (!isClosed) {
          emit(AddDoctorDataFailure(message: failure.message));
        }
      },
      (imageUrl) async {
        print('✅ Image Uploaded: $imageUrl');
        doctorEntity.imageUrl = imageUrl;
        print('🔄 Doctor image URL set, now saving to Firestore...');

        final addData = await fireStoreRepo.addDoctorData(doctorEntity);
        addData.fold(
          (failure) {
            print('❌ Firestore Save Failure: ${failure.message}');
            if (!isClosed) {
              emit(AddDoctorDataFailure(message: failure.message));
            }
          },
          (_) {
            print('✅ Firestore Save Success: Doctor data added!');
            if (!isClosed) {
              emit(AddDoctorDataSuccess());
            }
          },
        );
        if (!isClosed) {
          print('🎉 Final Success state emitted');
          emit(AddDoctorDataSuccess());
        }
      },
    );
  }
}
