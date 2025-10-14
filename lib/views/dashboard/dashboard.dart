import 'package:live_score_app/views/mood/mood_view.dart';
import 'package:live_score_app/views/nutrition/nutrition_view.dart';

import '../../../res/constants/imports.dart';
import '../../../widgets/lazy_stackindex.dart';
import '../../../widgets/nav_bar.dart';
import '../plan/plan_view.dart';
import '../profile/profile_view.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final int? index;

  const DashboardPage({this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(pageIndex: index ?? 0),
      builder: (controller) {
        int currentTab = controller.pageIndex;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: LazyIndexedStack(
            index: currentTab,
            children: [
              NutritionView(),
              PlanView(),
              MoodView(),
              ProfileView(),

            ],
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
           bottomNavigationBar: NavBar(),
        );
      },
    );
  }
}
