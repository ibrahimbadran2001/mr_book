import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_book/core/utlis/images_data.dart';
import 'package:mr_book/features/home/data/models/book_model.dart';

import '../book_details_view.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key, required this.imageUrl,
  });
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.5/4,
        child:CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context,value)=>const Center(child: CircularProgressIndicator()),
          errorWidget: (context,value,object)=>const Center(child: Icon(Icons.image_not_supported_outlined)),
        ),
      ),
    );
  }
}
