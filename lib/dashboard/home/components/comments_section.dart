import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/models/comment_model.dart';
import 'package:instagram_clone/dashboard/home/providers/home_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class CommentsSection extends StatelessWidget {
  CommentsSection({
    super.key,
    required this.postID,
  });
  final String postID;
  final commentC = TextEditingController();
  // final FocusNode _focusNode = FocusNode();
  @override
  build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Container(
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
          Row(
            children: [
              5.width,
              Expanded(
                  child: TextFieldWidget(
                height: 45,
                color: AppColors.mediumGrey,
                radius: 20,
                hintText: 'add comment',
                onChanged: (value) {
                  homeProvider.getComment(value);
                },
              )),
              IconButton(
                  onPressed: () {
                    homeProvider.addComments(context, postID);
                  },
                  icon: const Icon(Icons.send_outlined))
            ],
          ),
          Expanded(
            child: StreamBuilder<List<CommentModel>>(
                stream: homeProvider.getCommentsStream(postID),
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
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
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
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 17,
                              //image
                              backgroundImage:
                                  NetworkImage(snapshot.data![index].userimage),
                            ),
                            10.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //name
                                    snapshot.data![index].userName,
                                    style: AppTextStyle.boldWhite12,
                                  ),
                                  Text(
                                    //comment
                                    snapshot.data![index].comment,
                                    style: AppTextStyle.regularWhite12,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
