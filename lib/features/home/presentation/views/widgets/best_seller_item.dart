import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_book/features/home/data/models/book_model.dart';
import 'package:mr_book/features/home/presentation/views/book_details_view.dart';
import 'package:mr_book/features/home/presentation/views/widgets/book_rating_widget.dart';

import '../../../../../core/utlis/constants.dart';
import 'book_item.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> BookDetailsView(bookModel: bookModel,),transition: Transition.fade,duration: navigateDuration, );
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            BookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??'',),
            const SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.6,
                  child: Text(
                    '${bookModel.volumeInfo.title}',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.5,
                  child: Text(
                    bookModel.volumeInfo.authors?.first??'unknown',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.63,
                  child: Row(
                    children: [
                      Text(
                        'Free',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo.averageRating??0,
                        count:bookModel.volumeInfo.ratingsCount??0,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

