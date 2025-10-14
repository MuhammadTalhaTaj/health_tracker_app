import 'package:live_score_app/res/constants/imports.dart';


class CustomSearchTextFiled extends StatelessWidget {
  final String hinText;
  final TextEditingController? sfController;
  final bool showIcon;
  final VoidCallback? onSearchPress;
  final VoidCallback? onCancelPress;
  final bool showCancel;
  final Function(String value)? onChange;
  const CustomSearchTextFiled({
    this.onChange,
    this.onCancelPress,
    this.showCancel=false,
    this.onSearchPress,
    this.sfController,
    required this.hinText,
    this.showIcon=true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller:sfController,
      decoration: InputDecoration(

        hintText: hinText,
        hintStyle: context.bodyLarge,
        fillColor: context.onPrimary,
        filled: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: context.lightGrey)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: context.lightGrey)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: context.lightGrey)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: context.lightGrey)
        ),
        suffixIcon: (showIcon)? SizedBox(
          width: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            if(showCancel)  InkWell(
                onTap: onCancelPress,
                child:Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: context.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:Icon(Icons.close,color: context.onPrimary,),),
              ),
              InkWell(
                onTap: onSearchPress,
                child:Icon(Icons.search,color: context.primary,),
               // SvgPicture.asset(Assets.icons.search,height: 25,),
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ):null
      ),

    );
  }
}