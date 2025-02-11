import 'package:mr_book/features/home/data/models/book_model.dart';

abstract class SubjectBooksState{}
class FetchSubjectBooksInitialState extends SubjectBooksState{}
class FetchSubjectBooksLoadingState extends SubjectBooksState{}
class FetchSubjectBooksSuccessState extends SubjectBooksState{
  List<BookModel>subjectBooks;
  FetchSubjectBooksSuccessState({required this.subjectBooks});
}
class FetchSubjectBooksErrorState extends SubjectBooksState{
  final String error;
  FetchSubjectBooksErrorState(this.error);
}
class ChangeSubjectState extends SubjectBooksState{}
