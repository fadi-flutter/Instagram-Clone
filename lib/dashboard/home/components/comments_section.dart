import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/providers/home_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
    required this.postID,
  });
  final String postID;

  // final FocusNode _focusNode = FocusNode();
  @override
  build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            8.height,
            Text(
              'Comments',
              style: AppTextStyle.boldWhite16,
            ),
            4.height,
            Divider(
              color: AppColors.mediumGrey,
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage(banner),
                        ),
                        4.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'fadi_ops',
                                style: AppTextStyle.boldWhite12,
                              ),
                              Text(
                                'This is comment you can see it is very very simple ment you can see it is very very simple ',
                                style: AppTextStyle.regularWhite12,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                5.width,
                Consumer<HomeProvider>(
                  builder: ((context, value, child) {
                    return Expanded(
                        child: TextFieldWidget(
                      height: 45,
                      color: AppColors.mediumGrey,
                      controller: value.commentC,
                      radius: 20,
                      hintText: 'add comment',
                      onTap: () {
                        value.changeHeight(260);
                        print(value.fieldHeight);
                      },
                    ));
                  }),
                ),
                IconButton(
                    onPressed: () {
                      HomeProvider().addComments(context, postID);
                    },
                    icon: const Icon(Icons.send_outlined))
              ],
            ),
            Consumer<HomeProvider>(
                builder: ((context, value, child) => value.fieldHeight.height))
          ],
        ),
      ),
    );
  }
}
