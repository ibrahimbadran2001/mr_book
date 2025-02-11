import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:mr_book/features/home/data/models/book_model.dart';
import 'package:mr_book/features/home/presentation/manager/featured_books_cubit/featured_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/featured_books_cubit/featured_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_item.dart';
import '../../../../../core/utlis/constants.dart';
import '../book_details_view.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit,FeaturedBooksState>(
      builder: (BuildContext context, state) {
        if(state is FetchFeaturedBooksSuccessState){
          return SizedBox(
            height:  MediaQuery.sizeOf(context).height*0.28,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=> Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Get.Get.to(()=> BookDetailsView(bookModel: state.featuredBooks[index],),transition:Get.Transition.fade,duration: navigateDuration,);
                  },
                    child: BookItemWithRating(bookModel: state.featuredBooks[index],)
                ),
              ),
              itemCount: state.featuredBooks.length,
            ),
          );
        }else if(state is FetchFeaturedBooksErrorState){
         return Text(state.error.toString());
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
class BookItemWithRating extends StatelessWidget {
  final BookModel bookModel;
  const BookItemWithRating({super.key, required this.bookModel});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.bottomRight,
      children: [
        BookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2),
              child: Row(
                children: [
                 const  Icon(Icons.star,color: Colors.yellow,size: 18,),
                  const SizedBox(width: 2,),
                  Text(
                    '${bookModel.volumeInfo.averageRating??0}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[50]
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
