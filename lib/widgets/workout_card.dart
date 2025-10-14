import 'package:flutter/material.dart';
import 'package:live_score_app/res/constants/imports.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const WorkoutCard({required this.title, required this.subtitle, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border(left: BorderSide(color: Colors.tealAccent.withOpacity(0.9), width: 4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle, style: context.bodySmall),
                const SizedBox(height: 8),
                Text(title, style: context.titleMedium),
              ],
            ),
            const Icon(Icons.arrow_right_alt_outlined, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}
