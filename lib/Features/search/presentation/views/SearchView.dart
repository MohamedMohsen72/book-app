import 'package:bookly_app/Features/search/presentation/views/SearchView.dart';
import 'package:bookly_app/Features/search/presentation/views/widget/SearchResultListView.dart';
import 'package:bookly_app/Features/search/presentation/views/widget/searchviewbody.dart';
import 'package:bookly_app/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);

              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.whiteColor,
              )),
          centerTitle: true,
          title: Text(
            'Find Your Book',
            style: TextStyle(
              color: AppColor.whiteColor,
            ),
          ),
        ),

        body: Column(

          children: [
            const Gap(40),
            const SearchViewBody(),
            Expanded(child: SearchResultListView())
          ],
        ),
      ),
    );
  }
}



