import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mr_book/core/errors/failures.dart';
import 'package:mr_book/core/utlis/api_service.dart';

import '../data/models/book_model.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      var data= await apiService.get(
        endPoint:'volumes?Filtering=free-ebooks&maxResults=25&q=subject:fantasy',
      );
      List<BookModel>books=[];
      for (var item in data['items']) {
        var book=BookModel.fromJson(item);
        if(book.volumeInfo.averageRating>0){
          books.add(book);
        }
      }
      books.sort((a, b) => b.volumeInfo.averageRating.compareTo(a.volumeInfo.averageRating));
      return Right(books);
    } catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(errMessage: e.toString(),));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks()async {
      try {
        var data= await apiService.get(
          endPoint:'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:history',
        );
        List<BookModel>books=[];
        for(var item in data['items']){
          books.add(BookModel.fromJson(item));
        }
        return Right(books);
      } catch (e) {
        if (e is DioException){
          return Left(ServerFailure.fromDioException(e));
        }else{
          return Left(ServerFailure(errMessage: e.toString(),));
        }
      }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category})async {
    try {
      var data= await apiService.get(
        endPoint:'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category',
      );
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(errMessage: e.toString(),));
      }
    }
  }
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String book})async {
    try {
      var data= await apiService.get(
        endPoint:'volumes?Filtering=free-ebooks&q=$book',
      );
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(errMessage: e.toString(),));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBooksBySubject({required String subject})async {
    try {
      var data= await apiService.get(
        endPoint:'volumes?Filtering=free-ebooks&maxResults=20&q=subject:$subject',
      );
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(errMessage: e.toString(),));
      }
    }
  }
}