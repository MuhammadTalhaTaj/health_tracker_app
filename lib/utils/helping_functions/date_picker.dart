// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../res/constants/imports.dart';
//
// Future<DateTime?> showDatePickerDialog(BuildContext context,{bool showFeatureDate=false,required DateTime? initialDate}) async {
//   final DateRangePickerController controller = DateRangePickerController();
//   if (initialDate != null) {
//     controller.selectedDate = initialDate;
//   }
//
//   final selectedDate = await showDialog<DateTime>(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.5,
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: SfDateRangePicker(
//             initialDisplayDate: initialDate??DateTime.now(),
//             initialSelectedDate: initialDate??DateTime.now(),
//             controller: controller,
//             showActionButtons: true,
//             selectionMode: DateRangePickerSelectionMode.single,
//             maxDate:showFeatureDate?null: DateTime.now(),
//             onSubmit: (Object? value) {
//               final date = controller.selectedDate;
//               Navigator.pop(context, date);
//             },
//             onCancel: () => Navigator.pop(context),
//           ),
//         ),
//       );
//     },
//   );
//
//   return selectedDate;
// }
