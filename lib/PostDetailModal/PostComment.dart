import 'package:flutter/cupertino.dart';

class PostComment {
  int id;
  String name;
  String email;
  String date;
  String comment;


  PostComment({
    required this.id,
    required this.name,
    required this.email,
    required this.date,
    required this.comment
  });
}
