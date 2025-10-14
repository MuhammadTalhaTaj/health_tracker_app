// import 'dart:io';
//
//
// mixin CsvPickerMixin {
//   Future<File?> pickCsv() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['csv'],
//     );
//
//     if (result != null) {
//       PlatformFile file = result.files.first;
//       return File(file.path!);
//     } else {
//       // User canceled the file picking
//       return null;
//     }
//   }
// }
