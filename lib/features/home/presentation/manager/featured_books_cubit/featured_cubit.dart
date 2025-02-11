import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/featured_books_cubit/featured_states.dart';
import 'package:mr_book/features/home/repos/home_repo.dart';

class FeaturedCubit extends Cubit<FeaturedBooksState> {
  FeaturedCubit(this.homeRepo) : super(FetchFeaturedBooksInitialState());
  static FeaturedCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks()async{
    emit(FetchFeaturedBooksLoadingState());
    var result= await homeRepo.fetchFeaturedBooks();
    result.fold((failure){
      emit(FetchFeaturedBooksErrorState(failure.errMessage));
    },
      (books){
      emit(FetchFeaturedBooksSuccessState(featuredBooks: books));
    });
  }
}