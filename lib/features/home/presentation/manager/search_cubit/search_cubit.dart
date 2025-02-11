import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/newest_books_cubit/newest_states.dart';
import 'package:mr_book/features/home/presentation/manager/search_cubit/search_states.dart';
import 'package:mr_book/features/home/repos/home_repo.dart';

class SearchCubit extends Cubit<SearchBooksState> {
  SearchCubit(this.homeRepo) : super(SearchBooksInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void> searchBooks(String book)async{
    emit(SearchBooksLoadingState());
    var result= await homeRepo.searchBooks(book: book);
    result.fold((failure){
      emit(SearchBooksErrorState(failure.errMessage));
    },
      (books){
      emit(SearchBooksSuccessState(searchBooks: books));
    });
  }
}