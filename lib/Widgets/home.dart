import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/BookDetailModal/BookDetailModal.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/postDetail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/bookPreview.dart';

class HomeWidget extends StatefulWidget {

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isClose=false;
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
           isClose==false?Image.asset('assets/images/SaleBanner.png'):Container(),
           isClose==false? Positioned(
              bottom: 15,
              right: 15,
              //give the values according to your requirement
              child: IconButton(
                icon: Image.asset('assets/images/CloseIcon.png'),
                onPressed: () {
                  setState(() {
                    isClose=true;
                  });
                },
              ),
            ):Container(),
          ],
        ),
        //Image.asset('assets/images/SaleBanner.png'),
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Featured',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Nunito',
                ),
              )
            ],
          ),
        ),
        CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      image: AssetImage('assets/images/SliderImage.png'),
                      fit: BoxFit.cover),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Things in a wedding that are totally not worth it',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            options: CarouselOptions(
              autoPlay: false,
              height: 340.0,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              enlargeCenterPage: false,
            )),
        //Image.asset('assets/images/SaleBanner.png'),
        SizedBox(
          height: 80.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/PostHeaderIcon.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Latest Posts',
                    style: TextStyle(
                      color: HexColor('#3A3A3A'),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                    )),
              ),
              Spacer(),
              Text('See All',
                  style: TextStyle(
                    color: HexColor('#B6C2D5'),
                  )),
            ],
          ),
        ),
        SizedBox(height: 30.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 480.0,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: ListTile(
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
                                  onTap: () => {
                                    if (oPostDetail[index].postType == "Video")
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => postDetail(
                                                  postType: 'Video')),
                                        )
                                      }
                                    else if (oPostDetail[index].postType ==
                                        "Audio")
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => postDetail(
                                                  postType: 'Audio')),
                                        )
                                      }
                                    else
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => postDetail(
                                                  postType: 'Reading')),
                                        )
                                      }
                                  },
                                ),
                              )),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),

        SizedBox(
          height: 80.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/LibraryHeaderIcon.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Latest Books',
                    style: TextStyle(
                      color: HexColor('#3A3A3A'),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                    )),
              ),
              Spacer(),
              Text('See All',
                  style: TextStyle(
                    color: HexColor('#B6C2D5'),
                  )),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        SizedBox(
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
                                              );
                                            },
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
        ),
      ],
    );
  }
}
