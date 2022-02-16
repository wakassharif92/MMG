import 'dart:io';
import'package:flutter_mmg_bottomnavigation2/LoadBook/pdfLoad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/BookReading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
class bookPreview extends StatefulWidget {
  @override
  _bookPreviewState createState() => _bookPreviewState();
}

class _bookPreviewState extends State<bookPreview> {
  bool isBookmarked = false;
  bool isSwipe=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: HexColor('#FBFBFB'),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Transform.scale(
            scale: 2.0,
            child: IconButton(
              iconSize: 10.0,
              icon: Image.asset('assets/images/BackArrowIcon.png'),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 1.0,
                child: IconButton(
                  onPressed: (){SharePost(context);  },
                  icon:Icon(Icons.share),
                  color: HexColor('#B6C2D5'),
                ),
              ),

              Transform.scale(
                scale: 1.0,
                child: IconButton(
                  icon: isBookmarked == true
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border),
                  color: HexColor('#B6C2D5'),
                  onPressed: () {
                    setState(() {
                      if (isBookmarked == true) {
                        isBookmarked = false;
                      } else {
                        isBookmarked = true;
                      }
                    });

                  },
                ),
              ),
              SizedBox(width: 20.0)
            ],
          )
        ],
        centerTitle: false,
      ),
      body: BookMetaData(),
    );
  }

  Widget BookMetaData() {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 0,
              color: HexColor('#FBFBFB'),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Book.png',
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Book Title',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('##3A3A3A'),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                    )),
                                Text('Book Author',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('#32ACD8'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                    )),
                                SizedBox(
                                  height: 75.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          color: Colors.black12,
                                          width: 60.0,
                                          height: 35.0,
                                          child: Center(child: Text('PDF')),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          color: Colors.black12,
                                          width: 100.0,
                                          height: 35.0,
                                          child:
                                              Center(child: Text('215 Pages')),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          )
                        ],
                      ),
                    ]),
              )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'About this Book',
                      style: TextStyle(
                          color: HexColor('#3A3A3A'),
                          fontFamily: 'Nunito',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                      style: TextStyle(
                          color: HexColor('#3A3A3A'),
                          fontFamily: 'Nunito',
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
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
                          width: double.infinity,
                          height: 50.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Nunito',
                              ),
                            ),

                              onPressed: () async{
                                final path = 'assets/pdf/sample.pdf';
                                final file = await PDFApi.loadAsset(path);
                                openPDF(context, file);

                            },
                            child: Text('Read Now'),
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
    );
  }
  void SharePost(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share('Muslim Marriage Guide', subject: 'link');
  }
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );

}
