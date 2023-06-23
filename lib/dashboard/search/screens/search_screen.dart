import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/dashboard/profile/screens/profile_screen.dart';
import 'package:instagram_clone/dashboard/search/components/searched_user.dart';
import 'package:instagram_clone/dashboard/search/models/search_model.dart';
import 'package:instagram_clone/dashboard/search/providers/search_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchPovider searchProvider = SearchPovider();
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
            StreamBuilder<List<SearchModel>>(
              stream: searchProvider.getUsersStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Please check your internet connection\nand try again!',
                      style: AppTextStyle.regularBlack14,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.isEmpty) {
                  Center(
                    child: Text(
                      'Not posts found',
                      style: AppTextStyle.mediumWhite14,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => ProfileProvider(),
                                child: ProfileScreen(
                                    userID: snapshot.data![index].id),
                              ),
                            ),
                          );
                        },
                        child: SearchedUser(
                          user: snapshot.data![index],
                        ),
                      );
                    }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
