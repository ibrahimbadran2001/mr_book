import 'package:mr_book/features/home/data/models/book_model.dart';

abstract class NewestBooksState{}
class FetchNewestBooksInitialState extends NewestBooksState{}
class FetchNewestBooksLoadingState extends NewestBooksState{}
class FetchNewestBooksSuccessState extends NewestBooksState{
  List<BookModel>newestBooks;
  FetchNewestBooksSuccessState({required this.newestBooks});
}
class FetchNewestBooksErrorState extends NewestBooksState{
  final String error;
  FetchNewestBooksErrorState(this.error);
}

