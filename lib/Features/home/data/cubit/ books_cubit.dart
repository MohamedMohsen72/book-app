import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'books_state.dart';

class BooksCubit extends Cubit<RegularBooksState> {
  final ApiService apiService;

  BooksCubit(this.apiService) : super(RegularBooksInitial());

  Future<void> fetchBooks() async {
    emit(RegularBooksLoading());
    try {
      final books = await apiService.fetchBooks();
      emit(RegularBooksLoaded(books));
    } catch (e) {
      emit(RegularBooksError(e.toString()));
    }
  }


}
