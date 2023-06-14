import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/views/dashboard/home/components/app_bar.dart';

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
              height: 122,
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
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 09),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(banner),
                          ),
                          4.width,
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 1,
                            children: [
                              2.height,
                              Text(
                                'fadi_ops',
                                style: AppTextStyle.regularWhite12,
                              ),
                              Text(
                                'Fsd, Pakistan',
                                style: AppTextStyle.regularWhite12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more_horiz_outlined,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
                10.height,
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 18,
                        children: [
                          const Icon(Icons.favorite_outline, size: 26),
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGrey,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12)),
                                      ),
                                    );
                                  },
                                );
                              },
                              child:
                                  const Icon(Icons.comment_outlined, size: 26)),
                          const Icon(Icons.send, size: 26),
                        ],
                      ),
                      const Icon(Icons.save_alt, size: 26),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '100 likes',
                    style: AppTextStyle.boldWhite12,
                  ),
                ),
                4.height,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'This is description you read it but cannot change because i have not integrated backend yet 😂',
                    style: AppTextStyle.regularWhite12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
