import 'package:flutter/material.dart';
class BookRating extends StatelessWidget {
  const BookRating({
    super.key, required this.rating, required this.count,
  });
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star,color: Colors.yellow,),
        const SizedBox(width: 2,),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 5,),
        Text(
          '($count)',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
