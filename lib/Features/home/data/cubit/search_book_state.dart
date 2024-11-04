import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';

abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksLoaded extends SearchBooksState {
  final List<BookModel> books;
  SearchBooksLoaded(this.books);
}

class SearchBooksError extends SearchBooksState {
  final String error;
  SearchBooksError(this.error);
}
