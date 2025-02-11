import 'package:flutter/material.dart';
import 'package:mr_book/features/home/presentation/manager/subject_books_cubit/subject_cubit.dart';

import '../../../../../core/utlis/constants.dart';
import '../../../../../core/utlis/images_data.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key, required this.title, required this.index, required this.selectedIndex});
  final String title;
  final int index;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        SubjectCubit.get(context).setCurrentIndex(index);
        SubjectCubit.get(context).scrollToSelectedIndex(index, context);
        SubjectCubit.get(context).fetchSubjectBooks(subject: title);
      },
      child: AnimatedContainer(
        height: 40,
        width: 140,
        duration: const Duration(milliseconds: 500),
        // Animation duration
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedIndex == index ?
              secondColor
                  : Colors.grey.shade500
          ),
          borderRadius: BorderRadius.circular(10),
          color: selectedIndex == index
              ?  secondColor.withOpacity(0.2)
              : Theme
              .of(context)
              .scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            const SizedBox(width: 5,),
            Container(
              width: 40,
              height:30 ,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/images/${title.toLowerCase()}.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}