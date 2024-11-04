import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:bookly_app/Features/home/data/presentation/views/BookDetailsView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    this.widthContainer,
    this.heightContainer,
    this.image, required this.bookModel,
  });
  final double? widthContainer;
  final double? heightContainer;
  final String? image;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Bookdetailsview(bookModel: bookModel)));
        },
        child: CachedNetworkImage(
          imageUrl: image!,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_outlined),
        ),
      ),
    );
  }
}
