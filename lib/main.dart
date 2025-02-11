import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/core/utlis/service_locator.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_states.dart';
import 'package:mr_book/features/home/presentation/manager/featured_books_cubit/featured_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/newest_books_cubit/newest_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_cubit.dart';
import 'package:mr_book/features/home/repos/home_repo_impl.dart';
import 'package:mr_book/features/spalsh/presentation/views/splash_view.dart';

import 'core/local/cache_helper.dart';
import 'core/utlis/observer.dart';
import 'core/utlis/themes.dart';
import 'features/home/presentation/manager/app_cubit/app_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setUp();
  await CacheHelper.init();
  bool ? isDark=CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark??false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(
          create: (context) => FeaturedCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(create: (context)=>SearchCubit(getIt.get<HomeRepoImpl>(),)),
        BlocProvider(create: (context)=>SubjectCubit(getIt.get<HomeRepoImpl>(),)..fetchSubjectBooks(subject: subjects[0])),
      ],
      child: BlocBuilder<AppCubit,AppStates>(
          builder: (context,state){
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              home: const SplashView(),
            );
          }
      ),
    );
  }
}
