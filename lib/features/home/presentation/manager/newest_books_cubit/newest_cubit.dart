import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/newest_books_cubit/newest_states.dart';
import 'package:mr_book/features/home/repos/home_repo.dart';

class NewestCubit extends Cubit<NewestBooksState> {
  NewestCubit(this.homeRepo) : super(FetchNewestBooksInitialState());
  static NewestCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void> fetchNewestBooks()async{
    emit(FetchNewestBooksLoadingState());
    var result= await homeRepo.fetchNewestBooks();
    result.fold((failure){
      emit(FetchNewestBooksErrorState(failure.errMessage));
    },
      (books){
      emit(FetchNewestBooksSuccessState(newestBooks: books));
    });
  }
}