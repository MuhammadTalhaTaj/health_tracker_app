

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../res/constants/imports.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: context.primary,
        size: 80,
      ),
    );
  }
}
