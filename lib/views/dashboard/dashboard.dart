import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/views/dashboard/home/screens/home_screen.dart';

import 'profile/screens/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? lastPressedAt;
  int index = 0;
  List pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors.darkGrey,
          systemNavigationBarColor: AppColors.darkGrey),
    );
    return Scaffold(
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
              icon:
                  index == 3 ? Icons.favorite : Icons.favorite_outline_rounded,
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