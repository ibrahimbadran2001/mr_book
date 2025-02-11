import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/search_cubit/search_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/best_seller_item.dart';

class SearchViewBody extends StatelessWidget {
   SearchViewBody({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all( 20.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: searchController,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {
                if(value.isNotEmpty){
                  SearchCubit.get(context).searchBooks(value);
                }
              },
              style: Theme.of(context).textTheme.bodyMedium,
              //cursorColor: defaultColor.withOpacity(0.7),
              decoration: InputDecoration(
                icon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:  BorderSide(
                      color: Colors.grey.shade500,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:   BorderSide(
                      color: Colors.grey.shade500,
                    )
                ),
              ),
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SearchCubit,SearchBooksState>(
              builder: (context,state){
                if (state is SearchBooksInitialState){
                  return Container();
                }
                else if(state is SearchBooksSuccessState){
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index)=> BestSellerItem(bookModel: state.searchBooks[index],),
                      separatorBuilder: (context,index)=>const Divider(height: 20,),
                      itemCount: state.searchBooks.length,
                    ),
                  );
                }else if(state is SearchBooksErrorState){
                  return Center(child: Text(state.error));
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
