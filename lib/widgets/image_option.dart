

import '../res/constants/imports.dart';

class ImageOption {
  static Future<bool?> show(
    BuildContext context,
  ) async {
    bool? ifCameraIsSelected = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          // Update profile picture sheet
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Photo",
                    // style: Utilities.setTextStyle(
                    //   18,
                    //   FontWeight.w500,
                    //   color: AppColors.textGrey,
                    // ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _imageIconWidget(context, isCamera: true),
                      const SizedBox(width: 20),
                      _imageIconWidget(context, isCamera: false),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    return ifCameraIsSelected;
  }

  static Widget _imageIconWidget(BuildContext context,
      {required bool isCamera}) {
    double iconSize = 35;

    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
            radius: iconSize,
            backgroundColor: context.grey,
            child: Icon(
              isCamera ? Icons.camera_alt : Icons.photo_library,
              color: Colors.white,
              size: iconSize,
            ),
            // Image.asset(
            //   isCamera ? AppIcons.cameraIcon: AppIcons.gallery,
            //   color: Colors.white,
            // ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            isCamera ? "Camera" : "Gallery",
          )
        ],
      ),
      onTap: () {
        if (isCamera) {
          Navigator.of(context).pop(true);
        } else {
          Navigator.of(context).pop(false);
        }
      },
    );
  }
}
