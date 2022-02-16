import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:flutter/material.dart';

class PostData {
 static final List<PostDetail> oPostDetail = [
    PostDetail(
      postId: 1,
      postImage:
          'https://i.picsum.photos/id/434/200/300.jpg?hmac=OXYWBdR0QE1mGM2dKi1dktPcY5GckI3ClAgMsyszU-I',
      postTitle: 'The Last of Us',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.video_call_rounded, color: Colors.blue),
      postType: 'Video',
    ),
    PostDetail(
        postId: 2,
        postImage:
            'https://i.picsum.photos/id/388/200/200.jpg?hmac=yc4V5jCOMR-l634JzXmANfvSGFGgYWHQN4aKA69RvZo',
        postTitle: 'Death Stranding',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),
        postType: 'Audio'),
    PostDetail(
      postId: 3,
      postImage:
          'https://i.picsum.photos/id/108/200/200.jpg?hmac=JbZfKLS2wWv420Eq9HSIstvyiTaniwUcJjhDeOdwc88',
      postTitle: 'Globlet of Fire',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.menu_book_outlined, color: Colors.blue),
      postType: 'Reading',
    ),
    PostDetail(
        postId: 4,
        postImage:
            'https://i.picsum.photos/id/436/200/200.jpg?hmac=axiGy-zt6-TD5Hu1AD_rhudOgkfr-VQElZPKE592Mwc',
        postTitle: 'Chamber of Secrets',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),
        postType: 'Audio')
  ];
}
