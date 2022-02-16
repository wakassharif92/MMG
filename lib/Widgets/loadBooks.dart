import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/BookDetailModal/BookDetailModal.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/bookPreview.dart';
class loadBooks extends StatelessWidget {
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
    return         SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        oBookDetail[index].bookImage,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(oBookDetail[index].bookTitle,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('##3A3A3A'),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                    )),
                                Text(oBookDetail[index].bookAuthor,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('#32ACD8'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      color: Colors.black12,
                                      width: 60.0,
                                      height: 35.0,
                                      child: Center(
                                          child: Text(
                                              oBookDetail[index].bookType)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Container(
                                            color: HexColor('#35CDDE'),
                                          ),
                                        ),
                                        Container(
                                          width: 210.0,
                                          height: 36.0,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        bookPreview()),
                                              );},
                                            child: Text(
                                                oBookDetail[index].bookStatus),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ]),
              ));
        },
      ),
    );
  }
}

