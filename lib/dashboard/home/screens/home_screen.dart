import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/app_bar.dart';
import 'package:instagram_clone/dashboard/home/components/post_widget.dart';
import 'package:instagram_clone/dashboard/home/providers/home_provider.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            const AppBarWidget(),
            //storiesSection
            SizedBox(
              height: 118,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 09),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(banner), fit: BoxFit.cover),
                              border: Border.all(
                                  color: AppColors.pink,
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                              color: AppColors.white,
                              shape: BoxShape.circle),
                        ),
                        Text(
                          'Fahad Ali',
                          style: AppTextStyle.regularWhite12,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            //body
            Expanded(
              child: StreamBuilder<List<PostModel>>(
                stream: homeProvider.getforumPosts(),
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
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PostWidget(
                        post: snapshot.data![index],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
