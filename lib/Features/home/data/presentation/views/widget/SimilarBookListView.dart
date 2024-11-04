import 'package:bookly_app/Features/home/data/cubit/similar_book_state.dart';
import 'package:bookly_app/Features/home/data/cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/ListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatefulWidget {
  const SimilarBookListView({
    super.key, required this.bookModel,
  });
final BookModel bookModel;
  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {


  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    context.read<SimilarBooksCubit>().fetchSimilarBooks(widget.bookModel.volumeInfo!.categories .toString());
  }
  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<SimilarBooksCubit,RegularSimilarBooksState>(
        builder: ( context,  state) {
          if(state is SimilarBooksLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is SimilarBooksLoaded){
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomListViewItem(image: state.books[index].volumeInfo!.imageLinks!.thumbnail, bookModel: state.books[index],

                  ),
                );
              },
            );

          }
          else if (state is SimilarBooksError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
