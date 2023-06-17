import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({
    super.key,
  });

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  double sizedBox = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        sizedBox = 260; // Adjust the offset as needed
      });
    } else {
      setState(() {
        sizedBox = 0;
      });
    }
  }

  @override
  build(BuildContext context) {
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
              Expanded(
                child: TextFieldWidget(
                  focusNode: _focusNode,
                  height: 45,
                  color: AppColors.mediumGrey,
                  radius: 20,
                  hintText: '',
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.send_outlined))
            ],
          ),
          sizedBox.height
        ],
      ),
    );
  }
}
