import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:live_score_app/res/theme/theme_light.dart';
import 'package:live_score_app/views/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme,
      home:  DashboardPage(),
    );


  }
}


