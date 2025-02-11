import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
       body: HomeViewBody(),
     );
  }
}
