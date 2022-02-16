import 'package:flutter/material.dart';

import 'PostComment.dart';

class PostCommentData{
  static final List<PostComment>oPostCommentData=[
   PostComment(
     id:1,
     name:'Ali',
      email:'test@gmail.com',
      date:'05 February, 2021',
      comment:'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam'
   ),
    PostComment(
        id:2,
        name:'Usman',
        email:'test@gmail.com',
        date:'05 March, 2021',
        comment:'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam'
    ),
    PostComment(
        id:3,
        name:'Sulaiman',
        email:'test@gmail.com',
        date:'05 April, 2021',
        comment:'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam'
    ),
  ];
}