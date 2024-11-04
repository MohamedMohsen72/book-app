import 'package:bookly_app/Features/home/data/cubit/%20books_cubit.dart';
import 'package:bookly_app/Features/home/data/cubit/books_state.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/ListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({super.key});

  @override
  _FeaturedListViewState createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  @override
  void initState() {
    super.initState();
    context.read<BooksCubit>().fetchBooks();
  // استدعاء fetchBooks لتحميل البيانات
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BlocBuilder<BooksCubit, RegularBooksState>(
        builder: (context, state) {
          if (state is RegularBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RegularBooksLoaded) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: CustomListViewItem(image:state.books[index].volumeInfo!.imageLinks!.thumbnail, bookModel: state.books[index],),
                );
              },
            );
          } else if (state is RegularBooksError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
