import 'package:mr_book/features/home/data/models/book_model.dart';

abstract class SearchBooksState{}
class SearchBooksInitialState extends SearchBooksState{}
class SearchBooksLoadingState extends SearchBooksState{}
class SearchBooksSuccessState extends SearchBooksState{
  List<BookModel>searchBooks;
  SearchBooksSuccessState({required this.searchBooks});
}
class SearchBooksErrorState extends SearchBooksState{
  final String error;
  SearchBooksErrorState(this.error);
}

