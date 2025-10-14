import '../res/constants/imports.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final VoidCallback? onPress;
  const SimpleAppBar({
    this.onPress,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            onTap:onPress??()=>Get.back(),
              child: Icon(Icons.arrow_back_outlined,color: context.onSurface,size: 30,)
            //  SvgPicture.asset(Assets.icons.backButton,height: 35,width: 40,)
    )
    ),
      title: Text(title??'',style: context.titleMedium!.copyWith(color: context.onSurface),),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

