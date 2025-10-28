import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(File imagePath);
}
