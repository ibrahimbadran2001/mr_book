import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_states.dart';
import 'package:mr_book/features/home/repos/home_repo.dart';

class SubjectCubit extends Cubit<SubjectBooksState> {
  SubjectCubit(this.homeRepo) : super(FetchSubjectBooksInitialState());
  static SubjectCubit get(context) => BlocProvider.of(context);
  final ScrollController scrollController = ScrollController();
  int selectedIndex = 0;
  void setCurrentIndex(int index){
    selectedIndex = index;
  }
  void scrollToSelectedIndex(int index,context) {
    const double itemSize = 150.0; // Width of the category item
    const double separatorSize = 10.0; // Width of the separator
    final double viewportWidth = MediaQuery.of(context).size.width; // Viewport width
    double offset = (itemSize + separatorSize) * index;
    double maxOffset = offset - (viewportWidth - itemSize) / 2; // Adjusted offset
    //if(index!=0 && index!=categories.length-1)
    scrollController.animateTo(
      maxOffset,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOut,
    );
    emit(ChangeSubjectState());
  }
  HomeRepo homeRepo;
  Future<void> fetchSubjectBooks({required String subject})async{
    emit(FetchSubjectBooksLoadingState());
    var result= await homeRepo.fetchBooksBySubject(subject: subject);
    result.fold((failure){
      emit(FetchSubjectBooksErrorState(failure.errMessage));
    },
      (books){
      emit(FetchSubjectBooksSuccessState(subjectBooks: books));
    });
  }
}