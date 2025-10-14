// import 'dart:async';
//
// import '../res/constants/imports.dart';
//
// class FixedCropImage extends StatelessWidget {
//   final String imageUrl;
//
//   const FixedCropImage({super.key, required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ImageInfo>(
//       future: _getImageInfo(imageUrl),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return  Center(child: SvgPicture.asset(Assets.icons.logo,));
//
//         final imageHeight = snapshot.data!.image.height.toDouble();
//         const crop = 45.0;
//         final croppedHeight = imageHeight - (2 * crop);
//
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: SizedBox(
//             height: croppedHeight,
//             child: OverflowBox(
//               maxHeight: imageHeight,
//               alignment: Alignment.topCenter,
//               child: Transform.translate(
//                 offset: const Offset(0, -crop),
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   height: imageHeight,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<ImageInfo> _getImageInfo(String url) async {
//     final completer = Completer<ImageInfo>();
//     final image = NetworkImage(url);
//     final stream = image.resolve(const ImageConfiguration());
//
//     stream.addListener(
//       ImageStreamListener((info, _) {
//         completer.complete(info);
//       }),
//     );
//
//     return completer.future;
//   }
// }