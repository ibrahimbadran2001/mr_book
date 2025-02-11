import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_cubit.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_states.dart';
import 'package:mr_book/features/home/presentation/views/widgets/subject_widget.dart';

class SubjectsListView extends StatelessWidget {
  final List<String>subjects;
  const SubjectsListView({super.key, required this.subjects});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<SubjectCubit,SubjectBooksState>(
        builder: (BuildContext context, state) {
          return ListView.separated(
            controller: SubjectCubit.get(context).scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return SubjectContainer(title: subjects[index], index: index,selectedIndex: SubjectCubit.get(context).selectedIndex,);
            },
            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
            itemCount: subjects.length,
          );
        },
      ),
    );
  }
}