import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/createpost/screens/show_post.dart';
import 'package:instagram_clone/dashboard/profile/components/profile_widget.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      // appbar
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
          color: AppColors.darkGrey,
        ),
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
        child: SingleChildScrollView(
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
                                          color:
                                              AppColors.grey.withOpacity(0.4),
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
                child: Column(
                  children: [
                    const TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 110.0),
                      ),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      tabs: [
                        Tab(
                            child: Icon(
                          Icons.photo,
                          size: 27,
                        )),
                        Tab(
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 294,
                      child: TabBarView(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ShowPost()),
                                  );
                                },
                                child: Container(
                                  color: AppColors.grey,
                                ),
                              );
                            },
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 14,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return Container(
                                color: AppColors.grey,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
