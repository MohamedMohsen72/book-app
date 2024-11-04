import 'package:bookly_app/Features/search/presentation/views/SearchView.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'BOOKLY',
          style: getTextTitle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchView(),
              ));
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 33,
              color: Colors.white,
            ))
      ],
    );
  }
}
