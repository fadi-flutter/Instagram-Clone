import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/search/components/searched_user.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SafeArea(
        child: Column(
          children: [
            8.height,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 08, vertical: 10),
              child: TextFieldWidget(
                hintText: 'Search Users',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.grey,
                  size: 20,
                ),
                height: 45,
                color: AppColors.mediumGrey,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: ((context, index) {
                  return const SearchedUser();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
