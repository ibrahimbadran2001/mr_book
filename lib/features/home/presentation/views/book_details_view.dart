import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/data/models/book_model.dart';
import 'package:mr_book/features/home/presentation/manager/similar_books_cubit/similar_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/similar_books_cubit/similar_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_item.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_preview_button.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:mr_book/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:mr_book/features/home/repos/home_repo_impl.dart';

import '../../../../core/utlis/service_locator.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
         create:(BuildContext context)=>SimilarCubit(getIt.get<HomeRepoImpl>(),)..fetchSimilarBooks(category: bookModel.volumeInfo.categories?[0]??'Life'),
      child: Scaffold(
        body: BookDetailsViewBody(bookModel: bookModel,),
      ),
    );
  }
}

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const BookDetailsAppBar(),
                const SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.28),
                  child:  BookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??'',),
                ),
                BookRating(rating: bookModel.volumeInfo.averageRating??0, count: bookModel.volumeInfo.ratingsCount??0,),

                const SizedBox(height: 30,),
                Text(
                  '${bookModel.volumeInfo.title}',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5,),
                Text(
                  '(${bookModel.volumeInfo.publishedDate})'??'',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8,),
                Text(
                  getAuthors(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 16
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: BookPreviewButton(bookModel: bookModel,),
                ),
                const Expanded(child: SizedBox(height: 10,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Similar Books',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const SimilarBooksListView(),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        )
      ],
    );
  }
  String getAuthors(){
    String result='';
    for(var item in bookModel.volumeInfo.authors??['unknown']){
      result+= '$item\n';
    }
    return result;
  }
}





