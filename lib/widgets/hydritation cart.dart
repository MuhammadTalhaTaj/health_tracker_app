import 'package:flutter/material.dart';
import 'package:live_score_app/res/constants/imports.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HydrationCard extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double totalLiters;
  final double currentMl;

  const HydrationCard({
    super.key,
    required this.progress,
    required this.totalLiters,
    required this.currentMl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Percentage Text
              Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 8),


                  const Text(
                    'Hydration',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                 Text("Log now",style: context.bodySmall,),

              const SizedBox(height: 12),





            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff1B3D45),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: const Center(
            child: Text(
              '500 ml added to water log',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}
