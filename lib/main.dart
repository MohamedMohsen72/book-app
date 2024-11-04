
import 'package:bookly_app/Features/home/data/%20services/api_service.dart';
import 'package:bookly_app/Features/home/data/cubit/%20books_cubit.dart';
import 'package:bookly_app/Features/home/data/cubit/bestseller_books_cubit.dart';
import 'package:bookly_app/Features/home/data/cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/splash/data/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
      return BooksCubit(ApiService());
        }),
        BlocProvider(create: (context) {
          return BestsellerBooksCubit(ApiService());
        }),
        BlocProvider(create: (context) {
          return SearchBookCubit(ApiService());
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColor.primarycolor,
            appBarTheme: AppBarTheme(backgroundColor: AppColor.primarycolor),),
      
        home: const SplashView(),
      ),
    );
  }
}
