import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/core/utlis/images_data.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_cubit.dart';
import 'package:mr_book/features/home/presentation/views/home_view.dart';
import 'package:mr_book/features/spalsh/presentation/views/widgets/sliding_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
        () => const HomeView(),
        transition: Transition.fade,
        duration: navigateDuration,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCubit.get(context).isDark
            ? Image.asset(
                height: 200,
                width: 200,
                ImagesData.logo,
                fit: BoxFit.cover,
              )
            : Image.asset(
                height: 200,
                width: 200,
                ImagesData.lightLogo,
                fit: BoxFit.contain,
              ),
        const SizedBox(
          height: 5,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: Offset(0, 10), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
