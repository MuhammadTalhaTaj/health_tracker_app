import 'package:flutter/material.dart';
import 'package:live_score_app/res/constants/imports.dart';

import '../view_models/nurtition_view_model/nutrition_controller.dart';
class CalenderDateWidget extends StatelessWidget {
  CalenderDateWidget({
    super.key,
    required this.dt,
    required this.controller,
    required this.selected,
  });

  final DateTime dt;
  final bool selected;
  NutritionController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.shortDayName(dt.weekday), style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12)),
              6.h,
              Container(
                padding:EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: selected ? Border.all(color: selected ? context.secondary :Colors.transparent, width: 1) : null,
                ),
                child: Text('${dt.day}', style:context.bodyMedium),
              ),
              5.h,
              if(selected)    Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: selected ? context.secondary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
