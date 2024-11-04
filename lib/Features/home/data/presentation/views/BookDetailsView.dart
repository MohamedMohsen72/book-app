import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:bookly_app/Features/home/data/cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/BookdetailsviewBody.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/SimilarBookListView.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Bookdetailsview extends StatelessWidget {
  const Bookdetailsview({super.key, required this.bookModel});
  final BookModel  bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined,
                    size: 30, color: Colors.white)),
          )
        ],
        leading:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(onTap: () {
            Navigator.pop(context);
          },
            child: const Icon(Icons.close
                  ),
          ),)),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookDetailsBody(
                  bookModel: bookModel,
                ),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.only(left: 18),

                  child: Text(
                    'you can also like',
                    style: getTextbady(),
                  ),
                ),
                const Gap(10),
                BlocProvider(
                    create: (BuildContext context) {
                      return SimilarBooksCubit(ApiService());
                    },
                    child:  SimilarBookListView(bookModel: bookModel,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
