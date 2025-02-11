import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectCubit,SubjectBooksState>(
        builder: (context,state){
          if(state is FetchSubjectBooksSuccessState){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context ,index){
                  return BestSellerItem(bookModel: state.subjectBooks[index]);
                } ,
                separatorBuilder: (context ,index)=>const Divider(height: 20,),
                itemCount: state.subjectBooks.length,
              ),
            );
          }else if(state is FetchSubjectBooksErrorState){
            return Center(child: Text(state.error.toString()));
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
