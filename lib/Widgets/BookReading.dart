import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_mmg_bottomnavigation2/LoadBook/pdfLoad.dart';

class PDFViewerPage extends StatefulWidget {
  final File? file;

   PDFViewerPage({

    Key? key,
    @required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {


  late PDFViewController controller;
  late int pages = 0;
  late int indexPage = 0;
  num value = 1;
  int valueTest = 1;
  bool value1Tapped = false;
  bool value2Tapped = true;
  var popupColor = HexColor('#3A3A3A');
  bool isSwipe = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    //   print('opeeennnn');
    final name = basename(widget.file!.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: HexColor('#FBFBFB'),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Transform.scale(
              scale: 1.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: HexColor('#B6C2D5'),
              )),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 1.0,
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    SharePost(context);
                  },
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
              Transform.scale(
                scale: 1.0,
                child: PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: HexColor('#B6C2D5'),
                    ),
                    onSelected: (value) {
                      setState(() {
                        print('${isSwipe}');
                        if (value == 1) {
                          isSwipe = true;
                        } else {
                          isSwipe = false;
                        }
                      });
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                                trailing: value1Tapped == true
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/images/Tick.png'),
                                        onPressed: () {},
                                      )
                                    : null,
                                title: Text("Page View",
                                    style: value1Tapped == true
                                        ? TextStyle(
                                            color: HexColor('#32ACD8'),
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(color: popupColor))),
                            value: 1,
                            onTap: () {
                              setState(()  {
                                value1Tapped = true;
                                value2Tapped = false;

                              });
                            },
                            textStyle: value1Tapped == true
                                ? TextStyle(
                                    color: HexColor('#32ACD8'),
                                    fontWeight: FontWeight.bold)
                                : TextStyle(color: popupColor),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                                trailing: value2Tapped == true
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/images/Tick.png'),
                                        onPressed: () {},
                                      )
                                    : null,
                                title: Text("Scroll View",
                                    style: value2Tapped == true
                                        ? TextStyle(
                                            color: HexColor('#32ACD8'),
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(color: popupColor))),
                            value: 2,
                            onTap: () {
                              setState(()  {
                                value1Tapped = false;
                                value2Tapped = true;

                              });
                            },
                            textStyle: value2Tapped == true
                                ? TextStyle(
                                    color: HexColor('#32ACD8'),
                                    fontWeight: FontWeight.bold)
                                : TextStyle(color: popupColor),
                          )
                        ]),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          child: pages >= 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.0,
                      child: IconButton(
                        iconSize: 10.0,
                        icon: Image.asset('assets/images/BackArrow.png'),
                        color: Colors.blue,
                        onPressed: () {
                          final page = indexPage == 0 ? pages : indexPage - 1;
                          controller.setPage(page);
                          setState(() {
                            this.value = page;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    SliderTheme(
                      data: SliderThemeData(),
                      child: Container(
                          child: CupertinoSlider(
                        activeColor: HexColor('#32ACD8'),
                        thumbColor: HexColor('#32ACD8'),
                        divisions: pages,
                        onChangeStart: (value) {
                          //  print('${value}:start dragging');
                        },
                        onChangeEnd: (value) {
                          //   print('end dragging');
                        },
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                            //     print('${this.value}:changed value');
                            final page = indexPage = value.toInt();
                            controller.setPage(page);
                          });
                        },
                        min: 0,
                        max: pages.toDouble(),
                        value: value.toDouble(),
                      )),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: HexColor('#3A3A3A'),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Transform.scale(
                      scale: 1.0,
                      child: IconButton(
                        iconSize: 10.0,
                        icon: Image.asset('assets/images/ForwardArrow.png'),
                        color: Colors.blue,
                        onPressed: () {
                          final page =
                              indexPage == pages - 1 ? 0 : indexPage + 1;
                          controller.setPage(page);
                          setState(() {
                            this.value = page;
                            // print('ttttt${this.value}');
                          });
                        },
                      ),
                    )
                  ],
                )
              : Container(),
          preferredSize: Size.fromHeight(70.0),
        ),
        centerTitle: false,
      ),
      body: PdfBookWidget(),
    );
  }

  Widget PdfBookWidget() {
  return
      PDFView(
      filePath: widget.file!.path,
      // autoSpacing: false,
      swipeHorizontal:isSwipe,
      // pageSnap: false,
      // pageFling: false,
      onRender: (pages) => setState(() => {this.pages = pages!}),
      onViewCreated: (controller) =>
          setState(() => this.controller = controller),
      onPageChanged: (indexPage, _) =>
          setState(() => {this.indexPage = indexPage!, this.value = indexPage}),
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
