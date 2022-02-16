import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/BookDetailModal/BookDetailModal.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostComment.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostCommentData.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/postDetail.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/test.dart';
import 'package:hexcolor/hexcolor.dart';

class PostsWidget extends StatefulWidget {
  @override
  State<PostsWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {


  List<PostDetail> oPostDetail = [
    PostDetail(
      postId: 1,
      postImage:
          'https://i.picsum.photos/id/434/200/300.jpg?hmac=OXYWBdR0QE1mGM2dKi1dktPcY5GckI3ClAgMsyszU-I',
      postTitle: 'Dealing with Depression',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.video_call_rounded, color: Colors.blue),
      postType: 'Video',
    ),
    PostDetail(
        postId: 2,
        postImage:
            'https://i.picsum.photos/id/388/200/200.jpg?hmac=yc4V5jCOMR-l634JzXmANfvSGFGgYWHQN4aKA69RvZo',
        postTitle: 'How To Make The Most of Yourself',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),
        postType: 'Audio'),
    PostDetail(
      postId: 3,
      postImage:
          'https://i.picsum.photos/id/108/200/200.jpg?hmac=JbZfKLS2wWv420Eq9HSIstvyiTaniwUcJjhDeOdwc88',
      postTitle: 'Things in a wedding that are not totally worth it',
      postDate: '11/16/2021',
      postIcon: const Icon(Icons.menu_book_outlined, color: Colors.blue),
      postType: 'Reading',
    ),
    PostDetail(
        postId: 4,
        postImage:
            'https://i.picsum.photos/id/436/200/200.jpg?hmac=axiGy-zt6-TD5Hu1AD_rhudOgkfr-VQElZPKE592Mwc',
        postTitle: 'The Islamic Perspective',
        postDate: '11/16/2021',
        postIcon: const Icon(Icons.mic, color: Colors.blue),
        postType: 'Audio'),
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

  bool selected = false;


  List<FilterByType> _chipsList = [
    FilterByType("Posts", HexColor('#32ACD8'), Colors.black26, false),
    FilterByType("Podcast", HexColor('#32ACD8'), Colors.black26, false),
    FilterByType("Video", HexColor('#32ACD8'), Colors.black26, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSearchTextField(
                borderRadius: BorderRadius.circular(20.0),
                padding: EdgeInsets.all(10.0),
                placeholder: 'Search Posts',
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height:MediaQuery.of(context).size.height,
                  child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Align(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.14,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: ListTile(
                                    onTap: () => {
                                      if (oPostDetail[index].postType ==
                                          "Video")
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                 postDetail(postType:'Video')),
                                          )
                                        }
                                      else if (oPostDetail[index].postType ==
                                          "Audio")
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     postDetail(postType:'Audio')),
                                          )
                                        }
                                      else
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                 postDetail(postType:'Reading')),
                                          )
                                        }
                                    },
                                    //leading: CircleAvatar(backgroundImage: AssetImage('assets/images/SaleBanner.png'),),
                                    leading: Image.network(
                                      oPostDetail[index].postImage,
                                      width: 50.0,
                                    ),
                                    subtitle: Row(
                                      children: <Widget>[
                                        oPostDetail[index].postIcon,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child:
                                              Text(oPostDetail[index].postDate),
                                        ),
                                      ],
                                    ),

                                    title: Text(
                                      oPostDetail[index].postTitle,
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  List<Widget> typeChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          showCheckmark: false,
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].inactiveColor,
          selectedColor: _chipsList[i].activeColor,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              print(value);
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class FilterByType {
  String label;
  Color activeColor;
  Color inactiveColor;
  bool isSelected;
  FilterByType(
      this.label, this.activeColor, this.inactiveColor, this.isSelected);
}
