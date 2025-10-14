import 'package:live_score_app/res/constants/imports.dart';

import '../gen/assets.gen.dart';
import '../views/dashboard/dashboard_controller.dart';


class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      builder: (controller) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(0),
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(top: BorderSide(width: 0.5,color: context.lightGrey))
                ),
                width: double.infinity,
                height: 68,
                child: Row(
                  children: [
                    navItem(
                      context,
                      Assets.icons.nutritionSvg,
                      'Nutrition',
                      controller.pageIndex == 0,
                      onTap: () => controller.setPageIndex(0),
                    ),
                    navItem(
                      context,
                      Assets.icons.plan,
                      'Plan',
                      controller.pageIndex == 1,
                      onTap: () => controller.setPageIndex(1),
                    ),
                    navItem(
                      context,
                      Assets.icons.mood,
                      'Mood',
                      controller.pageIndex == 2,
                      onTap: () => controller.setPageIndex(2),
                    ),
                    navItem(
                      context,
                      Assets.icons.profile,
                      'Profile',
                      controller.pageIndex == 3,
                      onTap: () => controller.setPageIndex(3),
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget navItem(BuildContext context, String icon, String title, bool selected,
      {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
           // color: selected ? context.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 22,
                  width: 25,
               child:  SvgPicture.asset(icon,color:  selected ? context.primary : null,height: 22,),
              ),
              SB.h(5),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style:
                  context.bodySmall!.copyWith(color:  selected ? context.primary : null,fontWeight: FontWeight.w500),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
