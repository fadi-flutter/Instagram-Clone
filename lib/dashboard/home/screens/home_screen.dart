import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/app_bar.dart';
import 'package:instagram_clone/dashboard/home/components/post_widget.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const PostWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
