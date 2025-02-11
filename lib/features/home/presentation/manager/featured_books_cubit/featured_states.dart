import 'package:mr_book/features/home/data/models/book_model.dart';

abstract class FeaturedBooksState{}
class FetchFeaturedBooksInitialState extends FeaturedBooksState{}
class FetchFeaturedBooksLoadingState extends FeaturedBooksState{}
class FetchFeaturedBooksSuccessState extends FeaturedBooksState{
  List<BookModel>featuredBooks;
  FetchFeaturedBooksSuccessState({required this.featuredBooks});
}
class FetchFeaturedBooksErrorState extends FeaturedBooksState{
  final String error;
  FetchFeaturedBooksErrorState(this.error);
}

