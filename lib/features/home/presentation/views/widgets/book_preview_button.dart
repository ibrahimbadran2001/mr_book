import 'package:flutter/material.dart';
import 'package:mr_book/core/utlis/constants.dart';
import 'package:mr_book/features/home/presentation/views/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/book_model.dart';

class BookPreviewButton extends StatelessWidget {
  const BookPreviewButton({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'free',
            bgColor: Colors.white,
            textColor: myColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            fontWeight: FontWeight.w900,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: getText(bookModel),
            bgColor: secondColor,
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            fontWeight: FontWeight.w600,
            onPressed: ()async{
              Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
               await launchUrl(uri);
              }
            },
          ),
        ),
      ],
    );
  }
   String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink==null){
      return 'not available';
    }else{
      return 'preview';
    }
  }
}
