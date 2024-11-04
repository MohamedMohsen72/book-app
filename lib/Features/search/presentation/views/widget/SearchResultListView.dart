

import 'package:bookly_app/Features/home/data/cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/home/data/cubit/search_book_state.dart';
import 'package:bookly_app/Features/home/data/presentation/views/BookDetailsView.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/%20BestsellerlistviewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchResultListView extends StatelessWidget {
  SearchResultListView({super.key});

  final List<dynamic> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBooksState>(
      builder: (BuildContext context, state) {
        if (state is SearchBooksInitial) {
          // Show the "No results found" image and message initially
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_results.png', // Replace with your image path
                  width: 250,
                  height: 250,
                ),

                const Text(
                  'No results found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        } else if (state is SearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchBooksLoaded) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Bookdetailsview(bookModel: state.books[index]),
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
        } else if (state is SearchBooksError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Container();
        }
      },
    );
  }
}
