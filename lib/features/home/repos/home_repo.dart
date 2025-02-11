import 'package:dartz/dartz.dart';
import 'package:mr_book/core/errors/failures.dart';

import '../data/models/book_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure,List<BookModel>>> searchBooks({required String book});
  Future<Either<Failure,List<BookModel>>> fetchBooksBySubject({required String subject});
}