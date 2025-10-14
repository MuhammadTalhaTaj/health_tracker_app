
import '../../../res/constants/imports.dart';

class CaloriesCard extends StatelessWidget {
  final int total;
  final int remaining;

  const CaloriesCard({required this.total, required this.remaining, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final used = total - remaining;
    final percent = (used / total).clamp(0.0, 1.0);

    return Container(
      height: 160,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$used', style: context.titleMedium),
              2.w,
              Text('Calories', style: context.bodyLarge),
            ],
          ),
          Text(
            '$remaining Remaining',
            style: const TextStyle(color: Colors.white70),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                '0',
                style: const TextStyle(color: Colors.white70),
              ),
              const Spacer(),
              Text('$total', style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: percent,
            minHeight: 8,
            backgroundColor: Colors.white10,
          ),
        ],
      ),
    );
  }
}
