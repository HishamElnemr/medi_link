import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditDoctorImage extends StatefulWidget {
  const EditDoctorImage({
    super.key,
    required this.onFileChanged,
    // required this.doctorEntity,
  });
  final ValueChanged<File?>? onFileChanged;
  //final DoctorEntity doctorEntity;
  @override
  State<EditDoctorImage> createState() => _EditDoctorImageState();
}

class _EditDoctorImageState extends State<EditDoctorImage> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: fileImage != null
                    ? Image.file(fileImage!, fit: BoxFit.cover)
                    : CachedNetworkImageWidget(
                        imageUrl: '${getDoctorData().imageUrl}',
                        height: 200,
                        width: double.infinity,
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await pickImage();
                  } on Exception catch (e) {
                    debugPrint(e.toString());
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.symmetric(vertical: 6.5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBlue,
                  ),
                  child: SvgPicture.asset(Assets.assetsImagesEditProfile),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        fileImage = File(image.path);
      });
      widget.onFileChanged?.call(fileImage);
    }
  }
}
