import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widget/CustomButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
              'https://via.placeholder.com/150',
          fit: BoxFit.cover,
        ),
        const Gap(20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            bookModel.volumeInfo!.title.toString(),
            style: getTextTitle(),
          ),
        ),
        const Gap(10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,

          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            bookModel.volumeInfo?.authors?.isNotEmpty == true
                ? bookModel.volumeInfo!.authors![0]
                : "Unknown",
            style: getTextsmall(),
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellowAccent,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '4.8',
                style: getTextTitle(fontSize: 18),
              ),
            ),
            Text(
              '(2390)',
              style: getTextsmall(),
            )
          ],
        ),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custombutton(
              Textbutton: 'Free',
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  topLeft: Radius.circular(18)),
              buttonColor: Colors.white,
              ColorText: Colors.black,
            ),
            Custombutton(
onPressed: () async {
  Uri uri=Uri.parse(bookModel.volumeInfo!.previewLink!)  ;
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);

  }
},
              Textbutton: 'preview',
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(18),
                  topRight: Radius.circular(18)),
              buttonColor: const Color(0xffEF8262),
              ColorText: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}
