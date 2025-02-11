import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/similar_books_cubit/similar_cubit.dart';
import '../../manager/similar_books_cubit/similar_states.dart';
import '../book_details_view.dart';
import 'book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.16,
      child: BlocBuilder<SimilarCubit,SimilarBooksState>(
          builder: (context,state){
            if(state is FetchSimilarBooksSuccessState){
              return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> InkWell(
                    onTap: (){
                      // Navigate to BookDetailsView
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsView(bookModel: state.similarBooks[index]),
                        ),
                      );
                    },
                    child: BookItem(
                      imageUrl: state.similarBooks[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  ),
                  separatorBuilder: (context,index)=>const SizedBox(width: 8,),
                  itemCount: state.similarBooks.length
              );
            }else if(state is FetchSimilarBooksErrorState){
              return const Center(child: Text('there is no similar books for this book'));
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}