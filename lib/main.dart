import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/bookmark.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/home.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/library.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/posts.dart';
import 'package:flutter_mmg_bottomnavigation2/Widgets/splashscreen.dart';

import 'package:hexcolor/hexcolor.dart';
import 'PostDetailModal/PostDetail.dart';
import 'assets/my_flutter_app_icons.dart';


void main() {
  runApp(MaterialApp(home: splashScreen(), debugShowCheckedModeBanner: false,));
}

class BtmNavigationBar extends StatefulWidget {
  @override
  _BtmNavigationBarState createState() => _BtmNavigationBarState();
}

class _BtmNavigationBarState extends State<BtmNavigationBar> {
  bool showAppBar = false;
  late int currentIndex;
  String? currentTitle;
  bool isBookmarked = false;

  var currentHeaderIcon = Icon(null);
  //List<ChipData>chips=Chips.all;
  bool selected = false;
  bool selectedCategory = false;
  List<FilterByBook> _chipsBookList = [
    FilterByBook("PDF", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByBook("eBook", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
  ];
  List<FilterByType> _chipsList = [
    FilterByType("Posts", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByType("Podcast", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByType("Video", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
  ];
  List<FilterByCateogry> _chipsCategoryList = [
    FilterByCateogry("Before You Say 'I do'", HexColor('#32ACD8'),
        HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Case Studies", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Divorce", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Family Life", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "General", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Guest Articles", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Open Discussion", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Parenting", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Questions", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "RelationShip Issues", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Tip of the Week", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterByCateogry(
        "Webinar", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
  ];
  List<FilterBySortBy> _chipsSortBy = [
    FilterBySortBy(
        "Newest Articles", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterBySortBy("Features", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
    FilterBySortBy(
        "Most Popular", HexColor('#32ACD8'), HexColor('#F5F5F5'), false),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;

    currentTitle = null;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
      if (currentIndex == 0) {
        showAppBar = false;
        currentTitle = null;
        currentHeaderIcon = Icon(null);
      } else if (currentIndex == 1) {
        showAppBar = true;
        currentTitle = "Posts";
        currentHeaderIcon = Icon(Icons.dashboard);
      } else if (currentIndex == 2) {
        showAppBar = true;
        currentTitle = "Bookmark";
        currentHeaderIcon = Icon(Icons.bookmark);
      } else if (currentIndex == 3) {
        showAppBar = true;
        currentTitle = "Library";

        //currentHeaderIcon = Icon(Icons.boo);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F4F6F9'),
      appBar: showAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: (currentIndex == 1)
                          ? Image.asset('assets/images/PostHeaderIcon.png')
                          : (currentIndex == 2)
                              ? Image.asset(
                                  'assets/images/BookmarkHeaderIcon.png')
                              : (currentIndex == 3)
                                  ? Image.asset(
                                      'assets/images/LibraryHeaderIcon.png')
                                  : currentHeaderIcon,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    Text(
                      currentTitle ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
              actions: [
                Transform.scale(
                  scale: 2.0,
                  child: IconButton(
                    iconSize: 10.0,
                    icon: (currentIndex == 1)
                        ? Image.asset('assets/images/FilterIcon.png')
                        : (currentIndex == 2)
                            ? Image.asset('assets/images/FilterIcon.png')
                            : (currentIndex == 3)
                                ? Image.asset('assets/images/FilterIcon.png')
                                : currentHeaderIcon,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return bottomFilterSheet(setState);
                          });
                        },
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        )),
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
            )
          : null,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BubbleBottomBar(
                opacity: 1,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(10),
                onTap: changePage,
                items: <BubbleBottomBarItem>[
                  BubbleBottomBarItem(
                      backgroundColor: HexColor('#32ACD8'),
                      icon:Transform.scale(scale:0.9,child:  Icon(MyFlutterApp.homeicon, color: HexColor('#32ACD8'),)),
                      activeIcon:Transform.scale(scale:0.9,child:  Icon(MyFlutterApp.homeicon, color: Colors.white)),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      )),
                  BubbleBottomBarItem(
                      backgroundColor: HexColor('#32ACD8'),
                      icon: Icon(Icons.dashboard, color: HexColor('#32ACD8'),size: 25.0,),
                      activeIcon: Icon(Icons.dashboard, color: Colors.white),
                      title: Text(
                        'Posts',
                        style: TextStyle(color: Colors.white),
                      )),
                  BubbleBottomBarItem(
                      backgroundColor: HexColor('#32ACD8'),
                      icon: Transform.scale(scale:0.8,child: Icon(MyFlutterApp.bookmarkicon, color: HexColor('#32ACD8'))),
                      activeIcon: Transform.scale( scale:0.8, child: Icon(MyFlutterApp.bookmarkicon, color: Colors.white)),
                      title: Text(
                        'Bookmark',
                        style: TextStyle(color: Colors.white),
                      )),
                  BubbleBottomBarItem(
                      backgroundColor: HexColor('#32ACD8'),
                      icon: Transform.scale(scale:0.9,child: Icon(MyFlutterApp.libraryicon,
                          color: HexColor('#32ACD8'))),
                      activeIcon:Transform.scale(scale:0.9,child:  Icon(MyFlutterApp.libraryicon,
                          color: Colors.white)),
                      title: Text(
                        'Library',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
                currentIndex: currentIndex,
                hasInk: true,
                inkColor: Colors.black12,
                hasNotch: true,
              )),
        ),
      ),
      body: (currentIndex == 0)
          ? HomeWidget()
          : (currentIndex == 1)
              ? PostsWidget()
              : (currentIndex == 2)
                  ? BookmarkWidget()
                  : LibraryWidget(),
    );
  }

  Widget bottomFilterSheet(StateSetter setState) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Filter By Type',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0)),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                color: HexColor('#B6C2D5'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runSpacing: 20.0,
            spacing: 10.0,
            direction: Axis.horizontal,
            children: currentIndex == 1
                ? typeChips(setState)
                : currentIndex == 2
                    ? typeChips(setState)
                    : currentIndex == 3
                        ? bookChips(setState)
                        : typeChips(setState),
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Text('Filter By Category',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0)),
            ],
          ),
          Wrap(
            spacing: 4,
            direction: Axis.horizontal,
            children: categoryChips(setState),
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Text('Sort By',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0)),
            ],
          ),
          Wrap(
            spacing: 4,
            direction: Axis.horizontal,
            children: sortByChips(setState),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: HexColor('#B6C2D5'),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Clear All Filters',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: HexColor('#B6C2D5')),
                  )),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        color: HexColor('##32ACD8'),
                      ),
                    ),
                    Container(
                      width: 343.0,
                      height: 47.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Update Results'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> bookChips(StateSetter setState) {
    List<Widget> chips = [];

    for (int i = 0; i < _chipsBookList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          showCheckmark: false,
          label: Text(_chipsBookList[i].label),
          labelStyle: TextStyle(
              color: _chipsBookList[i].isSelected == true
                  ? Colors.white
                  : Colors.black),
          backgroundColor: _chipsBookList[i].inactiveColor,
          selectedColor: _chipsBookList[i].activeColor,
          selected: _chipsBookList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              // print(value);
              _chipsBookList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> typeChips(StateSetter setState) {
    List<Widget> chips = [];

    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          showCheckmark: false,
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(
              color: _chipsList[i].isSelected == true
                  ? Colors.white
                  : Colors.black),
          backgroundColor: _chipsList[i].inactiveColor,
          selectedColor: _chipsList[i].activeColor,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              // print(value);
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> categoryChips(StateSetter setState) {
    List<Widget> chipsCategory = [];

    for (int i = 0; i < _chipsCategoryList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          showCheckmark: false,
          label: Text(_chipsCategoryList[i].label),
          labelStyle: TextStyle(
              color: _chipsCategoryList[i].isSelected == true
                  ? Colors.white
                  : Colors.black),
          backgroundColor: _chipsCategoryList[i].inactiveColor,
          selectedColor: _chipsCategoryList[i].activeColor,
          selected: _chipsCategoryList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              // print(value);
              _chipsCategoryList[i].isSelected = value;
            });
          },
        ),
      );
      chipsCategory.add(item);
    }
    return chipsCategory;
  }

  List<Widget> sortByChips(StateSetter setState) {
    List<Widget> chipsSortBy = [];

    for (int i = 0; i < _chipsSortBy.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          showCheckmark: false,
          label: Text(_chipsSortBy[i].label),
          labelStyle: TextStyle(
              color: _chipsSortBy[i].isSelected == true
                  ? Colors.white
                  : Colors.black),
          backgroundColor: _chipsSortBy[i].inactiveColor,
          selectedColor: _chipsSortBy[i].activeColor,
          selected: _chipsSortBy[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              // print(value);
              _chipsSortBy[i].isSelected = value;
            });
          },
        ),
      );
      chipsSortBy.add(item);
    }
    return chipsSortBy;
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

class FilterByBook {
  String label;
  Color activeColor;
  Color inactiveColor;
  bool isSelected;
  FilterByBook(
      this.label, this.activeColor, this.inactiveColor, this.isSelected);
}

class FilterByCateogry {
  String label;
  Color activeColor;
  Color inactiveColor;
  bool isSelected;
  FilterByCateogry(
      this.label, this.activeColor, this.inactiveColor, this.isSelected);
}

class FilterBySortBy {
  String label;
  Color activeColor;
  Color inactiveColor;
  bool isSelected;
  FilterBySortBy(
      this.label, this.activeColor, this.inactiveColor, this.isSelected);
}
