import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:bookly_app/Features/home/data/cubit/similar_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<RegularSimilarBooksState> {
  final ApiService apiService;

  SimilarBooksCubit(this.apiService) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks(String categories) async {
    emit(SimilarBooksLoading());
    try {
      final books = await apiService.fetchSimilarBooks(categories);
      emit(SimilarBooksLoaded(books));
    } catch (e) {
      emit(SimilarBooksError(e.toString()));
    }
  }
}
