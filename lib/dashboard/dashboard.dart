import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/dashboard/createpost/providers/createpost_provider.dart';
import 'package:instagram_clone/dashboard/createpost/screens/create_post.dart';
import 'package:instagram_clone/dashboard/home/providers/home_provider.dart';
import 'package:instagram_clone/dashboard/home/screens/home_screen.dart';
import 'package:instagram_clone/dashboard/notifications/screens/notifications_screen.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/dashboard/profile/screens/profile_screen.dart';
import 'package:instagram_clone/dashboard/search/screens/search_screen.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final auth = FirebaseAuth.instance;
  DateTime? lastPressedAt;
  int index = 4;
  List pages = [
    const HomeScreen(),
    SearchScreen(),
    const CreatePost(),
    const NotificationsScreen(),
    ProfileScreen(
      userID: auth.currentUser!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors.darkGrey,
          systemNavigationBarColor: AppColors.darkGrey),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => CreatePostProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider())
      ],
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: Container(
          width: width,
          height: 50,
          color: AppColors.darkGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MenuItem(
                icon: index == 0 ? Icons.home : Icons.home_outlined,
                isActive: index == 0 ? true : false,
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
              MenuItem(
                icon: Icons.search,
                isActive: index == 1 ? true : false,
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
              MenuItem(
                icon: index == 2 ? Icons.add_box : Icons.add_box_outlined,
                isActive: index == 2 ? true : false,
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),
              MenuItem(
                icon: index == 3
                    ? Icons.favorite
                    : Icons.favorite_outline_rounded,
                isActive: index == 3 ? true : false,
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
              ),
              MenuItem(
                icon: Icons.circle_outlined,
                isActive: index == 4 ? true : false,
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.isActive,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final bool isActive;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: isActive ? AppColors.white : AppColors.grey,
        size: 28,
      ),
    );
  }
}
