import 'package:bookly_app/Features/home/data/model/book_model/BookModel.dart';
import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<BookModel>> fetchBooks() async {
    final response = await _dio.get('$baseUrl?orderBy=newest&q=programming');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['items'];
      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }


  Future<List<BookModel>> fetchBestsellerBooks () async {
    final response = await _dio.get('$baseUrl?newest&q=computer science');
    if (response.statusCode == 200) {
      // Ensure the data contains the key "items"
      List<dynamic> data = response.data['items'];
      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
  Future<List<BookModel>> fetchSimilarBooks (String categories) async {
    final response = await _dio.get('$baseUrl?sorting=relevance&q=$categories');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['items'];
      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<BookModel>> fetchSearchBooks (String search) async {
    final response = await _dio.get('$baseUrl?filter=free-ebooks&relevance&q=$search');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['items'];
      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

}
