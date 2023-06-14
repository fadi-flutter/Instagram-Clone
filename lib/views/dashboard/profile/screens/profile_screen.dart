import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/views/dashboard/profile/components/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      // appbar
      appBar: AppBar(
        title: Text(
          'fadi_ops',
          style: AppTextStyle.mediumWhite18,
        ),
        actions: [
          const Icon(
            Icons.list,
            color: AppColors.white,
            size: 26,
          ),
          15.width,
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //profileSection
            const ProfileWidget(),
            //highlights
            SizedBox(
              height: 122,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 07),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 09),
                    child: Column(
                      children: [
                        index != 0
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 7),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(banner),
                                        fit: BoxFit.cover),
                                    border: Border.all(
                                        color: AppColors.pink,
                                        width: 2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside),
                                    color: AppColors.white,
                                    shape: BoxShape.circle),
                              )
                            : Container(
                                margin: const EdgeInsets.only(bottom: 7),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey.withOpacity(0.4),
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside),
                                    color: AppColors.darkGrey,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                        Text(
                          index == 0 ? 'New' : 'Fahad Ali',
                          style: AppTextStyle.regularWhite12,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    const TabBar(
                      indicator: BoxDecoration(),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      tabs: [
                        Tab(
                          text: 'Chats',
                        ),
                        Tab(
                          text: 'Status',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            color: AppColors.white,
                            child: const Text('data'),
                          ),
                          Container(
                            color: AppColors.pink,
                            child: const Text('data'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
