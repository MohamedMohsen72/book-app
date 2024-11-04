
import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';

abstract class RegularSimilarBooksState {}

class SimilarBooksInitial extends RegularSimilarBooksState {}

class SimilarBooksLoading extends RegularSimilarBooksState {}

class SimilarBooksLoaded extends RegularSimilarBooksState {
  final List<BookModel> books;
  SimilarBooksLoaded(this.books);
}

class SimilarBooksError extends RegularSimilarBooksState {
  final String error;
  SimilarBooksError(this.error);
}

