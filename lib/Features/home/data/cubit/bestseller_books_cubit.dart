import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bestseller_books_state.dart';

class BestsellerBooksCubit extends Cubit<BestsellerBooksState> {
  final ApiService apiService;

  BestsellerBooksCubit(this.apiService) : super(BestsellerBooksInitial());

  Future<void> fetchBestsellerBooks() async {
    emit(BestsellerBooksLoading());
    try {
      final books = await apiService.fetchBestsellerBooks();  // يجب أن تكون لديك دالة في ApiService
      emit(BestsellerBooksLoaded(books));
    } catch (e) {
      emit(BestsellerBooksError(e.toString()));
    }
  }
}
