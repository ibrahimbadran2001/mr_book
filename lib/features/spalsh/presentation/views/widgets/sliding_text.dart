import 'package:flutter/material.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_cubit.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context,widget) {
        return SlideTransition(
          position: slidingAnimation,
          child:  Text(
            'Read books for free',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppCubit.get(context).isDark?Colors.grey.shade50:myColor,
            ),
          ),
        );
      }, animation: slidingAnimation,
    );
  }
}
