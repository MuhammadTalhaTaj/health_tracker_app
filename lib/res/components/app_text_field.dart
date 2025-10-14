import '../constants/imports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    // required this.hint,
    this.borderRadius,
    this.controller,
    this.isPasswordField = false,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.hintTextColor,
    this.textColor,
    this.suffixIcon,
    this.onSuffixTap,
    this.textAlign,
    this.textFieldBorder,
    this.onChange,
    this.textCapitalization = TextCapitalization.words,
    this.fillColor,
    this.showShadow = true,
    this.showBorder = true,
    this.maxLines = 1,
    this.prefixIcon,
    this.onTap,
    this.showBottomHeight=true,
    this.isRequiredField = false,
    this.hintText,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });
  final AutovalidateMode autovalidateMode; // default value for autovalidateMode
  final String? title, hintText, initialValue;
  final TextEditingController? controller;
  final bool isPasswordField;
  final bool showBottomHeight;
  final FormFieldValidator? validator;
  final bool readOnly;
  final bool enabled;
  final TextInputType? keyboardType;
  final Color? textColor, fillColor;
  final Color? hintTextColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixTap, onTap;
  final TextAlign? textAlign;
  final InputBorder? textFieldBorder;
  final Function(String value)? onChange;
  final TextCapitalization? textCapitalization;
  final bool showShadow, showBorder;
  final int maxLines;
  final bool isRequiredField;
  final double? borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title ?? '',
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.primary
                  ),
                ),
                if (widget.isRequiredField)
                  const Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 9,
                    ),
                  )
              ],
            ),
          ),
        TextFormField(

          initialValue: widget.initialValue,
          onTap: widget.onTap,
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: context.bodyLarge?.copyWith(
            color: context.onSecondary,
          ),
          obscuringCharacter: '*',
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          controller: widget.controller,
          onChanged: widget.onChange,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textAlign: widget.textAlign ?? TextAlign.start,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          validator: widget.validator ??
              (value) => value!.toString().trim().isEmpty
                  ? "${widget.title ?? widget.hintText ?? ''} ${AppStrings.cannotBeEmpty}"
                  : null,
          obscureText:
              widget.isPasswordField ? _hidePassword : widget.isPasswordField,
          autovalidateMode: widget.autovalidateMode,
          decoration: InputDecoration(

            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      color: context.grey,
                    ),
                  )
                : null,
            suffixIcon: widget.isPasswordField
                ? _hidePasswordIcon()
                : widget.suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(6),
                        child: InkWell(
                          onTap: widget.onSuffixTap,
                          borderRadius: BorderRadius.circular( 10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              widget.suffixIcon!,
                            ),
                          ),
                        ),
                      )
                    : null,
            hintText: widget.hintText,
            hintStyle: context.bodyLarge!.copyWith(color: Color(0xff434343)),
            fillColor: widget.fillColor,
            filled: true,
            contentPadding: //EdgeInsets.zero,
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            errorBorder: _border(context.error,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
            focusedErrorBorder: _border(context.primary,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
            enabledBorder: _border(context.primary,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
            disabledBorder: _border(context.extraLightGrey,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
            focusedBorder: _border(context.primary,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
            border: _border(context.grey,borderRadius: widget.borderRadius,showBorder: widget.showBorder),
          ),
        ),
     if(widget.showBottomHeight)
       SB.h(15),
      ],
    );
  }

  // InputBorder? _border() {
  //   return UnderlineInputBorder(borderSide: BorderSide(color: context.primary));
  // }

  void _toggleHidePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Widget _hidePasswordIcon() {
    return IconButton(
      onPressed: _toggleHidePassword,
      icon: Icon(
        _hidePassword ? Icons.visibility_off : Icons.visibility,
        color: context.primary,
      ),
    );
  }
}

class SimpleTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final bool readOnly;
  final bool? enabled;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final String? hint, prefixText;
  final Widget? suffixIcon;

  const SimpleTextField(
      {super.key,
      this.onTap,
      this.readOnly = false,
      this.enabled,
      this.controller,
      this.textCapitalization,
      this.keyboardType,
      this.hint,
      this.prefixText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        enabled: enabled,
        controller: controller,
        // onChanged:onChange,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        // textAlign:textAlign ?? TextAlign.start,
        keyboardType: keyboardType,
        // maxLines:maxLines,
        // validator:validator ??
        //     (value) => value!.toString().trim().isEmpty
        //         ? "${widget.title ?? ''} required"
        //         : null,
        // obscureText:
        //    isPasswordField ? _hidePassword :isPasswordField,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: _border(context.grey,),
          disabledBorder: _border(context.grey),
          focusedBorder: _border(context.primary),
          border: _border(context.grey),
          // fillColor:fillColor,
          filled: true,
          hintText: hint,
          hintStyle: context.bodySmall?.copyWith(color: context.grey),
          prefixIcon: prefixText != null
              ? SizedBox(
                  width: 0,
                  child: Center(
                    child: Text(
                      "${prefixText ?? ''}: ",
                      style: context.titleSmall,
                    ),
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(padding: const EdgeInsets.all(5), child: suffixIcon)
              : null,
          //   suffixIcon:isPasswordField
          //       ? _hidePasswordIcon()
          //       :suffixIcon != null
          //           ? Padding(
          //               padding: const EdgeInsets.all(6),
          //               child: InkWell(
          //                 onTap:onSuffixTap,
          //                 borderRadius: BorderRadius.circular(10),
          //                 child: Container(
          //                   padding: const EdgeInsets.all(10),
          //                   decoration: BoxDecoration(
          //                     color: context.primary,
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                   child: SvgPicture.asset(
          //                    suffixIcon!,
          //                   ),
          //                 ),
          //               ),
          //             )
          //           : null,
        ),
      ),
    );
  }
}

// class CustomPhoneField extends StatelessWidget {
//   const CustomPhoneField(
//       {super.key, required this.controller, this.title, this.hintText,  this.isRequiredField=false});
//
//   final TextEditingController controller;
//   final String? title, hintText;
//   final bool isRequiredField;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (title != null)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title!,
//                   style: context.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 if (isRequiredField)
//                   const Padding(
//                     padding: EdgeInsets.only(left: 3),
//                     child: Icon(
//                       Icons.star,
//                       color: Colors.red,
//                       size: 9,
//                     ),
//                   )
//               ],
//             ),
//           ),
//         IntlPhoneField(
//           controller: controller,
//           dropdownIconPosition: IconPosition.trailing,
//           initialCountryCode: 'PK',
//           showCountryFlag: false,
//           flagsButtonPadding: const EdgeInsets.only(left: 10),
//
//
//
//           decoration: InputDecoration(
//             errorBorder: _border(context.error),
//             focusedErrorBorder: _border(context.primary),
//             enabledBorder: _border(context.grey),
//             disabledBorder: _border(context.grey),
//             focusedBorder: _border(context.primary),
//             border: _border(context.grey),
//             counterText: ''
//           ),
//         ),
// SB.h(15),
//       ],
//     );
//   }
// }
InputBorder _border(Color borderColor,{double? borderRadius,bool? showBorder}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius??10),
    borderSide: BorderSide(color:showBorder==true? borderColor:Colors.transparent),
  );
}
