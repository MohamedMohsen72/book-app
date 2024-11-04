import 'package:bookly_app/Features/search/presentation/views/widget/customtextfield.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomTextField(),
        ],
      ),
    );
  }
}
