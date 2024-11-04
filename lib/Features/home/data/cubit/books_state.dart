

import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';


abstract class RegularBooksState {}

class RegularBooksInitial extends RegularBooksState {}

class RegularBooksLoading extends RegularBooksState {}

class RegularBooksLoaded extends RegularBooksState {
  final List<BookModel> books;
  RegularBooksLoaded(this.books);
}

class RegularBooksError extends RegularBooksState {
  final String error;
  RegularBooksError(this.error);
}




