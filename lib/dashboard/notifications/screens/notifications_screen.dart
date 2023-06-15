import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/notifications/components/notification_widget.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGrey,
        title: Text(
          'Notifications',
          style: AppTextStyle.boldWhite18,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: 4,
        itemBuilder: (context, index) {
          return NotificationWidget(
            index: index,
          );
        },
      )),
    );
  }
}
