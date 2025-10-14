// import 'dart:developer';
// import 'dart:io';
// import 'package:cocoon/utils/helping_functions/split_name.dart';
// import 'package:cocoon/view/auth/signup/general_info.dart';
// import 'package:cocoon/view/auth/signup/signup_page.dart';
// import 'package:cocoon/view_models/models/sign_up/sign_up_view_model.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import '../../data/apis/api_function.dart';
// import '../../gen/assets.gen.dart';
// import '../../res/constants/imports.dart';
// import '../../view/community/community_view.dart';
// import '../../view/dashboard/dashboard.dart';
// import '../../view/splash/splash_controller.dart';
// import '../../view_models/models/user_controller/user_controller.dart';
//
//
// mixin SocialSignIn {
//   final GoogleSignIn _googleSignIn = Platform.isIOS
//       ? GoogleSignIn(
//     scopes: ['email'],
//     clientId:
//     "634545719947-ee59sj96p18i9b9outquu031oa0k6cqe.apps.googleusercontent.com",
//   )
//       : GoogleSignIn(
//     scopes: ['email'],
//   );
//
//   //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   String? _fcmToken;
//
//   Widget socialButton(BuildContext context, bool isSignIN  , {bool formSignup=false}) => Row(
//     children: [
//       Expanded(
//         child: AppButton.outline(
//           background: context.onPrimary,
//           borderColor: context.primary,
//           // borderRadius: BorderRadius.circular(10),
//           onPressed:()=> _signInWithGoogle(formSignup),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//           SvgPicture.asset(Assets.icons.google) ,
//               Text(
//                 'Google',
//                 style: context.titleSmall?.copyWith(
//                   fontSize: 16
//                   // color: context.onPrimary,
//                 ),
//               ),
//               const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//      if (Platform.isIOS)
//         SB.w(10),
//       if (Platform.isIOS)
//         Expanded(
//           child: AppButton.outline(
//             background: context.onPrimary,
//             borderColor: context.primary,
//             // borderRadius: BorderRadius.circular(10),
//             onPressed: ()=>_signInWithApple(formSignup),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(Assets.icons.apple2,height: 30,) ,
//                 Text(
//                   'Apple',
//                   style: context.titleSmall?.copyWith(
//                       fontSize: 16
//                     // color: context.onPrimary,
//                   ),
//                 ),
//                 const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//       // if (Platform.isIOS) ...[
//       //   SB.h(10),
//       //   AppButton.primary(
//       //     background: context.scaffoldBackgroundColor,
//       //     onPressed: _signInWithApple,
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       children: [
//       //         Assets.icons.apple.svg(),
//       //         Text(
//       //           'Continue with apple',
//       //           style: context.titleMedium?.copyWith(
//       //             color: context.onPrimary,
//       //           ),
//       //         ),
//       //         const SizedBox(),
//       //       ],
//       //     ),
//       //   ),
//       // ]
//     ],
//   );
//
//   Future<void> _signInWithGoogle(bool fromSignUp) async {
//     Get.dialog(const CustomLoader());
//     await _googleSignIn.signOut();
//     try {
//       final GoogleSignInAccount? credential = await _googleSignIn.signIn();
//       debugPrint(credential.toString());
//       if (credential != null) {
//         Map<String,String> splitName=splitFullName(credential.displayName);
//         await callApi(credential.email,splitName['firstName']??'',splitName['lastName']??'',fromSignUp);
//         }
//       else {
//         Get.back();
//           showErrorToastMessage('There is some error try again');
//         }
//         _googleSignIn.signOut();
//       log(credential.toString());
//     } catch (error) {
//       debugPrint(error.toString());
//       Get.back();
//     }
//   }
//
//
//   Future<void> callApi(String email,String firstName,String lastName,bool fromSignUp,{String appleId=''})async{
//     final response = await apiCall(
//       POST,
//       'Account/Social_Login',
//       {
//         "email": email,
//         "first_Name": firstName,
//         "last_Name": lastName,
//         "apple_Id": appleId
//
//       },
//       showLoader: false,
//       fromJson: UserModel.fromJson,
//     );
//     print(response);
//     if (response is UserModel) {
//       Get.offAll(()=>DashboardPage());
//       storageBox.write('userData', response);
//       UserController userController= Get.find<UserController>();
//       Get.back();
//       try {
//         userController.setUserData(response);
//         response.kids.first.bornYet ||
//             isPastOrToday(response.kids.first.dob)
//             ? Get.offAll(() => DashboardPage())
//             : Get.offAll(() => CommunityView());
//       } catch (e) {
//         showErrorToastMessage('There is some error try again');
//         return;
//
//       }
//
//     } else {
//       Get.back();
//       SignupViewModel signupViewModel = Get.put(SignupViewModel());
//       signupViewModel.tfEmail.text=email;
//       signupViewModel.tfFirstName.text=firstName;
//       signupViewModel.tfLastName.text=lastName;
//       signupViewModel.appleId=appleId;
//       signupViewModel.isSocialAccount = true;
//       signupViewModel.socialAccountType= appleId.isNotEmpty || appleId!='' ? 105: 106;
//        Get.to(()=>GeneralInfo());
//
//     }
//   }
//
//
//   Future<void> _signInWithApple(bool formSignup) async {
//     Get.dialog(const CustomLoader());
//     try {
//       var credential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );
//
//       debugPrint(credential.toString());
//       debugPrint(credential.userIdentifier);
//
//      if(credential!=null) {
//        String email,firstName,lastName='';
//        final savedAppleData = await storageBox.read('apple_user_data');
//        if ((credential.email == null || credential.givenName == null) && savedAppleData != null) {
//          email = savedAppleData['email'];
//          firstName = savedAppleData['firstName'];
//          lastName = savedAppleData['lastName'];
//        } else {
//          email = credential.email ?? '';
//          firstName = credential.givenName?? '';
//          lastName = credential.familyName ?? '';
//          await storageBox.write('apple_user_data', {
//            'email': credential.email,
//            'firstName': firstName,
//            'lastName': lastName,
//            'userId': credential.userIdentifier,
//          });
//        }
//         await callApi(email,firstName, lastName, formSignup, appleId: credential.userIdentifier??'');
//       }
//
//     } catch (error) {
//       print(error);
//       Get.back();
//     }
//   }
//
//
// }
