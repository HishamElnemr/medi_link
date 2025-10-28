import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?>? onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
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
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!, fit: BoxFit.cover),
                    )
                  : const Icon(Icons.file_upload_outlined, size: 120),
            ),
            if (fileImage != null)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        fileImage = null;
                      });
                      widget.onFileChanged?.call(null);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
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
