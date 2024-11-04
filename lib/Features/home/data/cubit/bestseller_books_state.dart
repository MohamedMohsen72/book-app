import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';

abstract class BestsellerBooksState {}

class BestsellerBooksInitial extends BestsellerBooksState {}

class BestsellerBooksLoading extends BestsellerBooksState {}

class BestsellerBooksLoaded extends BestsellerBooksState {
  final List<BookModel> books;
  BestsellerBooksLoaded(this.books);
}

class BestsellerBooksError extends BestsellerBooksState {
  final String error;
  BestsellerBooksError(this.error);
}