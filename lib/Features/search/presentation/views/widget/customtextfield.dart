import 'package:bookly_app/Features/home/data/cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          TextField(
            onChanged:
            (value) {
              context.read<SearchBookCubit>().fetchSearchBooks(value);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Search',
              suffixIcon:
                  const Opacity(opacity: 0.8, child: Icon(Icons.search_rounded)),
            ),
          )
        ],
      ),
    );
  }
}
