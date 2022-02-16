import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/BookDetailModal/BookDetailModal.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostData.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/loadBooks.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/loadPostsWidget.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/test.dart';
import 'package:hexcolor/hexcolor.dart';

class BookmarkWidget extends StatefulWidget {
  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  late int currentIndex;
  final colorActive=HexColor('#32ACD8');
  final colorInActive=HexColor('#B6C2D5');
  @override
  void initState(){
    super.initState();
    currentIndex=0;

  }
  changeWidget(int index){
    setState(() {
      currentIndex=index;
    });
  }

  List<PostDetail> oPostDetail = [
    PostDetail(
      postId: 1,
      postImage:
      'https://i.picsum.photos/id/434/200/300.jpg?hmac=OXYWBdR0QE1mGM2dKi1dktPcY5GckI3ClAgMsyszU-I',
      postTitle: 'The Last of Us',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.video_call_rounded, color: Colors.blue),
      postType:'Video',
    ),
    PostDetail(
        postId: 2,
        postImage:
        'https://i.picsum.photos/id/388/200/200.jpg?hmac=yc4V5jCOMR-l634JzXmANfvSGFGgYWHQN4aKA69RvZo',
        postTitle: 'Death Stranding',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),
        postType:'Audio'
    ),
    PostDetail(
      postId: 3,
      postImage:
      'https://i.picsum.photos/id/108/200/200.jpg?hmac=JbZfKLS2wWv420Eq9HSIstvyiTaniwUcJjhDeOdwc88',
      postTitle: 'Globlet of Fire',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.menu_book_outlined, color: Colors.blue),
      postType:'Reading',
    ),
    PostDetail(
        postId: 4,
        postImage:
        'https://i.picsum.photos/id/436/200/200.jpg?hmac=axiGy-zt6-TD5Hu1AD_rhudOgkfr-VQElZPKE592Mwc',
        postTitle: 'Chamber of Secrets',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),postType:'Audio'),


  ];

  List<BookDetail> oBookDetail = [
    BookDetail(
        bookId: 1,
        bookImage: 'assets/images/Book.png',
        bookTitle: 'Book Title',
        bookType: 'PDF',
        bookStatus: 'Read Now',
        bookAuthor: 'Author'),
    BookDetail(
        bookId: 2,
        bookImage: 'assets/images/Book1.png',
        bookTitle: 'Book Title',
        bookType: 'eBook',
        bookStatus: 'Continue Reading',
        bookAuthor: 'Author'),
    BookDetail(
        bookId: 3,
        bookImage: 'assets/images/Book2.png',
        bookTitle: 'Book Title',
        bookType: 'ePub',
        bookStatus: 'Read Now',
        bookAuthor: 'Author'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.only(top: 50.0), children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/PostHeaderIcon.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
//                            color: HexColor('#32ACD8'),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                    )),
                    onPressed: () {
                      changeWidget(0);
                      currentIndex=0;
                    },
                    child: Text(
                      'Posts',
                      style: TextStyle(color: currentIndex==0?colorActive:colorInActive),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Image.asset('assets/images/LibraryHeaderIcon.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
//                          color: HexColor('#B6C2D5'),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                    )),
                    onPressed: () {
                      changeWidget(1);
                      currentIndex=1;
                      loadBooks();
                    },
                    child: Text(
                      'Books',
                      style: TextStyle(color: currentIndex==1?colorActive:colorInActive),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        currentIndex==0?loadPosts():(currentIndex==1)?loadBooks():loadPosts(),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Expanded(
//                child: SizedBox(
//                  height: 425.0,
//                  child: new ListView.builder(
//                      physics: NeverScrollableScrollPhysics(),
//                      itemCount: 4,
//                      itemBuilder: (context, index) {
//                        return Align(
//                          child: SizedBox(
//                            width: MediaQuery.of(context).size.width * 0.9,
//                            height: MediaQuery.of(context).size.height * 0.14,
//                            child: Card(
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.circular(15.0)),
//                                child: Padding(
//                                  padding: const EdgeInsets.symmetric(
//                                      vertical: 12.0),
//                                  child: ListTile(
//                                    //leading: CircleAvatar(backgroundImage: AssetImage('assets/images/SaleBanner.png'),),
//                                    leading: Image.network(
//                                      oPostDetail[index].postImage,
//                                      width: 50.0,
//                                    ),
//                                    subtitle: Row(
//                                      children: <Widget>[
//                                        oPostDetail[index].postIcon,
//                                        Padding(
//                                          padding:
//                                              const EdgeInsets.only(left: 10.0),
//                                          child:
//                                              Text(oPostDetail[index].postDate),
//                                        ),
//                                      ],
//                                    ),
//
//                                    title: Text(
//                                      oPostDetail[index].postTitle,
//                                      style: TextStyle(
//                                          fontFamily: 'Nunito',
//                                          fontWeight: FontWeight.w900),
//                                    ),
//                                    onTap: () {},
//                                  ),
//                                )),
//                          ),
//                        );
//                      }),
//                ),
//              )
//            ],
//          ),
        ]),
      ),
    );
  }
}
