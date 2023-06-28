import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/createpost/providers/createpost_provider.dart';
import 'package:instagram_clone/dashboard/profile/components/edit_text_field.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    final createPostProvider = Provider.of<CreatePostProvider>(context);
    final sizeh = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return imagetoastWidget(context, createPostProvider);
                      });
                },
                child: createPostProvider.profileImage.path.isEmpty
                    ? Container(
                        color: AppColors.darkGrey,
                        height: sizeh * 0.4,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo,
                              color: AppColors.grey,
                              size: 40,
                            ),
                            Text(
                              'Gallery',
                              style: AppTextStyle.boldWhite14
                                  .copyWith(color: AppColors.grey),
                            )
                          ],
                        ),
                      )
                    : createPostProvider.selectedImage
                        ? Container(
                            height: sizeh * 0.4,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(createPostProvider.profileImage.path),
                                ),
                              ),
                            ),
                          )
                        : Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: sizeh * 0.4,
                                child: VideoPlayer(createPostProvider.videoC!),
                              ),
                              IconButton(
                                onPressed: () {
                                  createPostProvider.playpauseVideo();
                                },
                                icon: Icon(
                                  createPostProvider.playVideo
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 40,
                                  color: AppColors.blue,
                                ),
                              ),
                            ],
                          ),
              ),
              EditTextField(
                text: 'Description',
                controller: createPostProvider.descriptionC,
              ),
              150.height,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: AppColors.blue,
                  minWidth: double.infinity,
                  onPressed: () {
                    createPostProvider.uploadPost(context);
                  },
                  child: Text(
                    'Post',
                    style: AppTextStyle.mediumWhite14,
                  ),
                ),
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}

Widget imagetoastWidget(context, CreatePostProvider provider) {
  final listofIcon = <IconData>[Icons.image, Icons.video_file];
  final listofText = ['Image', 'Video'];
  return Dialog(
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select One',
            style: AppTextStyle.mediumBlack16,
          ),
          5.height,
          const Divider(color: AppColors.black, height: 1),
          ListView(
            shrinkWrap: true,
            children: List.generate(
              2,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      //for image
                      provider.pickSource(true);
                      break;
                    case 1:
                      //for video
                      provider.pickSource(false);
                      break;
                    default:
                  }
                },
                leading: Icon(
                  //list of icons created top
                  listofIcon[index],
                  size: 22,

                  color: AppColors.black,
                ),
                //list of text created top
                title: Text(
                  listofText[index],
                  style: AppTextStyle.mediumBlack14,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
