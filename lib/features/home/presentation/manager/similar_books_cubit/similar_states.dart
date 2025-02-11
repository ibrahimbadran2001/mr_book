import 'package:mr_book/features/home/data/models/book_model.dart';

abstract class SimilarBooksState{}
class FetchSimilarBooksInitialState extends SimilarBooksState{}
class FetchSimilarBooksLoadingState extends SimilarBooksState{}
class FetchSimilarBooksSuccessState extends SimilarBooksState{
  List<BookModel>similarBooks;
  FetchSimilarBooksSuccessState({required this.similarBooks});
}
class FetchSimilarBooksErrorState extends SimilarBooksState{
  final String error;
  FetchSimilarBooksErrorState(this.error);
}

