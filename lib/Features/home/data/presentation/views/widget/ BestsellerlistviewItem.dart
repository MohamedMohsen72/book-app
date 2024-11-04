import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestsellerlistviewItem extends StatelessWidget {
  const BestsellerlistviewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              width: 80,
              height: 120,
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://via.placeholder.com/150',

                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  bookModel.volumeInfo!.title.toString(),
                  style: getTextTitle(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  bookModel.volumeInfo?.authors?.isNotEmpty == true
                      ? bookModel.volumeInfo!.authors![0]
                      : "Unknown",
                  style: getTextsmall(),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Free',
                    style: getTextTitle(),
                  ),
                  const Gap(70),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        '4',
                        style: getTextTitle(fontSize: 18),
                      ),
                      Text(
                        '(2390)',
                        style: getTextsmall(),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
