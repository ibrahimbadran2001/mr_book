import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_states.dart';
import '../../../../../core/utlis/images_data.dart';
import '../../../../search/presentation/views/search_view.dart';
import '../../manager/app_cubit/app_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 10 ),
          child: Row(
            children: [
              Image.asset(
                height: 62,
                width: 62,
                AppCubit.get(context).isDark?ImagesData.logo2:ImagesData.lightLogo,
              ),
              const Spacer(),
              IconButton(
                  onPressed: (){
                    Get.to(()=>const SearchView(),duration: navigateDuration, );
                  },
                  icon:  const Icon(
                    size: 25,
                    Icons.search,
                  )
              ),
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon:AppCubit.get(context).isDark?
                const Icon(
                  Icons.dark_mode,
                )
                    :  const Icon(
                  Icons.light_mode,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
