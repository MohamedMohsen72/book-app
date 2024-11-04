import 'package:bookly_app/Features/home/data/presentation/views/widget/Bestsellerlistview.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/CustomAppBar.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widget/Featured%20List%20View.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomAppBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FeaturedListView(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Newest Books',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
      
              fillOverscroll: true,
              child: Bestsellerlistview(),
            )
          ],
        ),
      ),
    );
  }
}
