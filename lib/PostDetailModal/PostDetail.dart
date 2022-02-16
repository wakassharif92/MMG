import 'package:flutter/cupertino.dart';

class PostDetail{
  int postId;
  String postImage;
  String postTitle;
  String postDate;
  Icon postIcon;
  String postType;

  PostDetail({
    required this.postId,
    required this.postImage,
    required this.postTitle,
    required this.postDate,
    required this.postIcon,
    required this.postType
  });
}