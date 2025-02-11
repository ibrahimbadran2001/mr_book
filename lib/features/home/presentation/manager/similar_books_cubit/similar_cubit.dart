import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/similar_books_cubit/similar_states.dart';
import 'package:mr_book/features/home/repos/home_repo.dart';

class SimilarCubit extends Cubit<SimilarBooksState> {
  SimilarCubit(this.homeRepo) : super(FetchSimilarBooksInitialState());
  static SimilarCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category})async{
    emit(FetchSimilarBooksLoadingState());
    var result= await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure){
      emit(FetchSimilarBooksErrorState(failure.errMessage));
    },
      (books){
      emit(FetchSimilarBooksSuccessState(similarBooks: books));
    });
  }
}