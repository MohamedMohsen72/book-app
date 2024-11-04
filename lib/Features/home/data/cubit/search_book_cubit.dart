import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:bookly_app/Features/home/data/cubit/search_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookCubit extends Cubit<SearchBooksState> {
  final ApiService apiService;

  SearchBookCubit(this.apiService) : super(SearchBooksInitial());

  Future<void> fetchSearchBooks(String search) async {
    emit(SearchBooksLoading());
    try {
      final books = await apiService.fetchSearchBooks(search);
      emit(SearchBooksLoaded(books));
    } catch (e) {
      emit(SearchBooksError(e.toString()));
    }
  }
}
