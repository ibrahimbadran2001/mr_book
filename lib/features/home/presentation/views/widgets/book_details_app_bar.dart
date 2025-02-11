import 'package:flutter/material.dart';
import 'package:mr_book/core/utlis/images_data.dart';
import 'package:mr_book/features/home/presentation/manager/app_cubit/app_cubit.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.clear),
          ),
          AppCubit.get(context).isDark?
          Image.asset(
            height: 62,
            width: 62,
            ImagesData.logo2,
          ):Text(
            'MR.BOOK',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
