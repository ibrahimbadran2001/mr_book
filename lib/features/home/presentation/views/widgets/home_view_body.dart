import 'package:flutter/material.dart';

import 'package:mr_book/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:mr_book/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:mr_book/features/home/presentation/views/widgets/subjects_list_view.dart';

import '../../../../../core/utlis/constants.dart';
import 'best_seller_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
      slivers: [
        SliverToBoxAdapter  (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: HomeAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Top Rated Books',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const BooksListView(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Text(
                  'Get books by subjects',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: SubjectsListView(subjects: subjects,),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}




