import '../../../res/constants/imports.dart';
import '../gen/assets.gen.dart';


class WeightCard extends StatelessWidget {
  final double weightKg;
  final double delta;

  const WeightCard({required this.weightKg, required this.delta, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${weightKg.toInt()}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              8.w,
              Text('kg', style: context.bodyLarge),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.icons.kg,color: context.secondary,),
              6.w,
              Text('+1.6kg',style: context.bodySmall,)
            ],
          ),
          const Spacer(),
          Text('Weight', style:context.titleSmall),
        ],
      ),
    );
  }
}
