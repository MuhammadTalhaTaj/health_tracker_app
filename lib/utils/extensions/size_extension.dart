
import '../../res/constants/imports.dart';

extension IntExtensions on int {

  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());
}