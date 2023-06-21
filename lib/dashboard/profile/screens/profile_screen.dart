import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/createpost/screens/show_post.dart';
import 'package:instagram_clone/dashboard/profile/components/profile_highlights.dart';
import 'package:instagram_clone/dashboard/profile/components/profile_widget.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final myProvider = Provider.of<ProfileProvider>(context, listen: false);
    myProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      // appbar
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
          color: AppColors.darkGrey,
        ),
        title: Text(
          //username
          profileProvider.userName,
          style: AppTextStyle.mediumWhite18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              profileProvider.getProfile();
            },
            icon: const Icon(
              Icons.list,
              color: AppColors.white,
              size: 26,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //profileSection
              ProfileWidget(
                profileProvider: profileProvider,
              ),
              //highlights
              SizedBox(
                height: 122,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 07),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProfileHighlights(index: index);
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
                      height: MediaQuery.of(context).size.height - 274,
                      child: TabBarView(
                        children: [
                          StreamBuilder<List<PostModel>>(
                              stream: profileProvider.getPostsStream(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      'Please check your internet connection\nand try again!',
                                      style: AppTextStyle.regularBlack14,
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                return GridView.builder(
                                  padding: const EdgeInsets.only(top: 2),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
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
                                            builder: (context) => ShowPost(
                                              post: snapshot.data![index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                snapshot.data![index].image),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
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
