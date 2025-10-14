
import '../../../res/constants/imports.dart';

class DashBoardController extends GetxController {
  int pageIndex;
  DashBoardController({this.pageIndex = 0});

  void setPageIndex(int index) {
    pageIndex = index;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}
