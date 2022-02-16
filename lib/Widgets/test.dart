import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/BookDetailModal/BookDetailModal.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostDetail.dart';
import 'package:hexcolor/hexcolor.dart';

class test extends StatefulWidget {
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  bool selected = false;
  bool test=false;
  List<FilterByType> _chipsList = [
    FilterByType("Posts", HexColor('#32ACD8'), Colors.black26, false),
    FilterByType("Podcast", HexColor('#32ACD8'), Colors.black26, false),
    FilterByType("Video", HexColor('#32ACD8'), Colors.black26, false),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.account_box),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return bottomFilterSheet(setState);
                    });
              },
              isScrollControlled: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
            );
          },
          iconSize: 10.0,
        ),
      ],
    ));
  }

  Widget bottomFilterSheet(StateSetter setState) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Filter By Type',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
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
            spacing: 4,
            direction: Axis.horizontal,
            children: typeChips(setState ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Text('Filter By Category',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0)),
            ],
          ),
          SizedBox(height: 50.0),
          Row(
            children: [
              Text('Sort By',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0)),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
              style: TextButton.styleFrom(
                primary: HexColor('#B6C2D5'),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Nunito',
                ),
              ),
              onPressed: () {},
              child: Text(
                'Clear All Filters',
                style: TextStyle(fontSize: 14.0),
              )),
          SizedBox(
            height: 20.0,
          ),
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
          )
        ],
      ),
    );
  }

  List<Widget> typeChips(StateSetter setState) {
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
}

class FilterByType {
  String label;
  Color activeColor;
  Color inactiveColor;
  bool isSelected;
  FilterByType(
      this.label, this.activeColor, this.inactiveColor, this.isSelected);
}
