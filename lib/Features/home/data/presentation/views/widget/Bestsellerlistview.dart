import 'package:bookly_app/Features/home/data/cubit/bestseller_books_cubit.dart';
import 'package:bookly_app/Features/home/data/cubit/bestseller_books_state.dart';
import 'package:bookly_app/Features/home/data/presentation/views/BookDetailsView.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/%20BestsellerlistviewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bestsellerlistview extends StatefulWidget {
  const Bestsellerlistview({super.key});

  @override
  State<Bestsellerlistview> createState() => _BestsellerlistviewState();
}

class _BestsellerlistviewState extends State<Bestsellerlistview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BestsellerBooksCubit>().fetchBestsellerBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellerBooksCubit, BestsellerBooksState>(
      builder: (context, state) {
        if (state is BestsellerBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BestsellerBooksLoaded) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  Bookdetailsview(bookModel: state.books[index]),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: BestsellerlistviewItem(
                  bookModel: state.books[index],
                ),
              ),
            ),
          );
        } else if (state is BestsellerBooksError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Container();
        }
      },
    );
  }
}
