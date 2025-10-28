import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/core/services/storage_services.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/domain/repos/images_repo.dart';


class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage(File imagePath) async {
    try {
      String url = (await storageServices.uploadFile(
        imagePath,
        BackendEndpoints.images,
      ));
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to upload image: ${e.toString()}'),
      );
    }
  }
}
