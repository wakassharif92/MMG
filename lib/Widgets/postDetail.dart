// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostComment.dart';
import 'package:flutter_mmg_bottomnavigation2/PostDetailModal/PostCommentData.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:share_plus/share_plus.dart';

class postDetail extends StatefulWidget {
  final String postType;

  postDetail({Key? key, required this.postType}) : super(key: key);

  @override
  _postDetailState createState() => _postDetailState(postTypes: this.postType);
}

class _postDetailState extends State<postDetail> {
  String? nameText;
  String? emailText;
  bool isBookmarked=false;
  var _FormKey = GlobalKey<FormState>();
bool isLoading=true;
  var changeForm;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late YoutubePlayerController _videoController;
  List<PostComment> _postComment = PostCommentData.oPostCommentData;
  final String postTypes;
  bool playing = false;
  Image imgIcon = Image.asset('assets/images/PlayIcon.png');
  AudioCache _cache = AudioCache();
  AudioPlayer _player = AudioPlayer();
  Duration position = new Duration();
  Duration musicLength = new Duration();
  bool isShowMusicController = false;
  bool isShowVideoController = false;
  final String? videoURL = 'aa';
  final List<String> _ids = ['IHFsIXHWnYo'];
  void playVideo() {
    _videoController = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        forceHD: false,
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        activeColor: HexColor('#35CDDE'),
        inactiveColor: HexColor('#F5F5F5'),
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  seekToSec(int sec) {
    Duration newSec = Duration(seconds: sec);
    _player.seek(newSec);
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    playVideo();
    if (postTypes == 'Audio') {
      isShowMusicController = true;
      isShowVideoController = false;
    } else if (postTypes == "Video") {
      isShowMusicController = false;
      isShowVideoController = true;
    } else {
      isShowMusicController = false;
      isShowVideoController = false;
    }
    super.initState();
    _player = AudioPlayer();
    _cache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen((d) {
      setState(() {
        //    print('onduration:+${d}');
        musicLength = d;
      });
    });
    _player.onAudioPositionChanged.listen((d) {
      //print('onaudio:+${d}');
      setState(() {
        position = d;
        if (position.inSeconds.toDouble() == musicLength.inSeconds.toDouble()) {
          playing = false;
          imgIcon = Image.asset('assets/images/PlayIcon.png');
          print('ss:${playing}');
        }
      });
    });
    // _cache.load("music/MusicAudio.mp3");
  }

  @override
  Future<void> deactivate() async {
    super.dispose(); //change here

    // _videoController.pause();
  }

  @override
  Future<void> dispose() async {
    nameController.dispose();
    emailController.dispose();
    super.dispose(); //change here
    await _player.stop();
    //_videoController.dispose();
  }

  _postDetailState({required this.postTypes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FBFBFB'),
      body: PostDetailWidget(),
    );
  }

  Widget PostDetailWidget() {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            postTypes == 'Video'
                ? VideoWidget()
                : Image.asset('assets/images/ReadingPost.png'),
            //    postTypes=='Reading'?Image.asset('assets/images/ReadingPost.png'),
            //Image.asset('assets/images/ReadingPost.png'),
            Positioned(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  Transform.scale(
                    scale: 2.0,
                    child: IconButton(
                      iconSize: 10.0,
                      icon: Image.asset('assets/images/BackArrowIcon.png'),
                      onPressed: () {
                        print('clicked');


                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 4.0,
                    child: IconButton(
                      iconSize: 10.0,
                      icon: Icon(
                        (Icons.share),
                        color: HexColor('#B6C2D5'),
                      ),
                      //icon: Image.asset('assets/images/ShareIcon.png'),
                      onPressed: () {
                        SharePost(context);
                      },
                    ),
                  ),
                  Transform.scale(
                    scale: 4.0,
                    child: IconButton(
                      iconSize: 10.0,
                      icon:isBookmarked==true? Icon(
                        (Icons.bookmark_border),
                        color: HexColor('#B6C2D5'),
                      ):Icon(
                        (Icons.bookmark),
                        color: HexColor('#B6C2D5'),
                      ),
//                      icon: Image.asset('assets/images/BookmarkIcon.png'),
                      onPressed: ()  {
                       setState(() {
                         if(isBookmarked==true){
                           isBookmarked=false;
                           print('bookmarkFlase');
                         }
                         else{
                           isBookmarked=true;
                           print('bookmarkTrue');
                         }
                       });


                      },
                    ),
                  ),
                ])),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'April 15, 2020',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: HexColor('#B6C2D5')),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Expectations in the Reality',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: HexColor('#6A6A6A'))),
                SizedBox(
                  height: 50.0,
                ),
                postTypes == 'Audio' ? MusicController() : EmptyRow(),
                postTypes == 'Audio' ? slider() : EmptyRow(),
                postTypes == 'Audio' ? MusicMinutes() : EmptyRow(),
                postTypes == 'Audio'
                    ? SizedBox(
                        height: 50.0,
                      )
                    : SizedBox(
                        height: 0.0,
                      ),
//                Visibility(
//                    visible: isShowMusicController,
//                    child: MusicController()),
//                Visibility(
//                    visible: isShowMusicController,
//                    child: slider()),
//                Visibility(
//                    visible: isShowMusicController,
//                    child: MusicMinutes()),
//                Visibility(
//                    visible: isShowMusicController,
//                    child:  SizedBox(
//                      height: 50.0,
//                    )),

                Text(
                    'If you\'re looking for random paragraphs, you\'ve come to the right place. When a random word or a random sentence isn\'t quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind. The process is quite simple. Choose the number of random paragraphs you\'d like to see and click the button. Your chosen number of paragraphs will instantly appear. While it may not be obvious to everyone, there are a number of reasons creating random paragraphs can be useful. A few examples of how some people use this generator are listed in the following paragraphs.',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: HexColor('#6A6A6A'))),
                SizedBox(
                  height: 120.0,
                ),
                Container(
                  child: Stack(
                    children: [
                      TextField(
                          maxLines: 2,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: 'Type Your Comment',
                              hintStyle: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: HexColor('#919EA7'),
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                              filled: true,
                              fillColor: HexColor('#F0F4F7'),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                    color: HexColor('#F0F4F7'), width: 2),
                              ))),
                      Positioned(
                          top: 15.0,
                          left: 305.0,
                          child: Transform.scale(
                            scale: 2.3,
                            child: IconButton(
                              iconSize: 8.0,
                              icon: Image.asset(
                                  'assets/images/SendCommentIcon.png'),
                              onPressed: () async {
                                await UserDetailDialog();
                                setState(() {
                                  _postComment.add(PostComment(
                                      id: _postComment.length + 1,
                                      name: nameController.text,
                                      comment: '',
                                      email: emailController.text,
                                      date: '06 February 2022'));
                                  LoadCommentList();
                                });
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [Text('${_postComment.length} Comments')],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 425.0,
                        child: LoadCommentList(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  void SharePost(BuildContext context) async{
    final box = context.findRenderObject() as RenderBox?;
await Share.share('Muslim Marriage Guide',subject: 'link');
  }
  Widget LoadCommentList() {
    return new ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _postComment.length,
        itemBuilder: (context, index) {
          return Align(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Card(
                  elevation: 0,
                  color: HexColor('#FBFBFB'),
//                                      shape: RoundedRectangleBorder(
//                                          side: BorderSide(color: HexColor('#FBFBFB'), width: 1),
//                                         ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/AvatarIcon.png'),
                        ),
                        subtitle: Expanded(
                          child: Container(
                            child: Text(_postComment[index].comment),
                          ),
                        ),
                        title: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 30.0,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text(
                              _postComment[index].name,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.circle,
                              color: HexColor('#919EA7'),
                              size: 6.0,
                            ),
                            Text(_postComment[index].date),
                          ],
                        )),
                  )),
            ),
          );
        });
  }

  Future<String?> UserDetailDialog() {
    changeForm = _FormKey;
    return showDialog<String>(
        context: context,
        builder: (context) => Form(
              child: AlertDialog(
                key: changeForm,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: Center(
                    child: Text(
                  'Your Details',
                  style: TextStyle(
                      fontFamily: 'Nunito', fontWeight: FontWeight.w500),
                )),
                content: Container(
                  height: 100.0,
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onSaved: (nameVal) {
                            nameText = nameVal;
                          },
                          controller: nameController,
                          autofocus: true,
                          decoration: InputDecoration(hintText: 'Name'),
                        ),
                        TextFormField(
                          onSaved: (emailVal) {
                            emailText = emailVal;
                          },
                          controller: emailController,
                          decoration: InputDecoration(hintText: 'Email'),
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          //print(nameController.text);
                          Navigator.pop(context);
                        });
                      },
                      child: Text('SUBMIT'))
                ],
              ),
            ));
  }

  Widget VideoWidget() {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _videoController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: HexColor('#B6C2D5'),
        ),
        builder: (builder, player) {
          return Container(child: player);
        });
  }

  Widget EmptyRow() {
    return Container();
  }

  Widget MusicMinutes() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text("${position.toString().split(".")[0]}"),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Text("${musicLength.toString().split(".")[0]}"),
        ),
      ],
    );
  }

  Widget MusicController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          spacing: 25,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Transform.scale(
              scale: 2.0,
              child: IconButton(
                iconSize: 10.0,
                icon: Image.asset('assets/images/BackIcon.png'),
                onPressed: () {
                  if ((position.inSeconds.toDouble() - 15) >= 0 &&
                      position.inSeconds.toDouble() >= 15) {
                    //    print('position:+${position.inSeconds.toDouble()+15}');
                    //  print('musiclength:+${musicLength.inSeconds.toDouble()}');
                    _player.seek(Duration(seconds: position.inSeconds - 15));
                  } else if ((position.inSeconds.toDouble()) <= 15) {
                    _player.seek(Duration(seconds: 0));
                  } else {
                    print('exceeds');
                  }

                  //print(_player.seek(Duration(seconds:position.inSeconds-15)));
                },
              ),
            ),
            Transform.scale(
              scale: 2.0,
              child: IconButton(
                iconSize: 10.0,
                icon: imgIcon,
                onPressed: () {
                  setState(() {
                    if (!playing) {
                      //print('test!');
                      _cache.play("music/MusicAudio.mp3");
                      imgIcon = Image.asset('assets/images/PauseIcon.png');
                      playing = true;
                    } else {
                      _player.pause();
                      //  print('test');
                      imgIcon = Image.asset('assets/images/PlayIcon.png');
                      playing = false;
                    }
                  });
                },
              ),
            ),
            Transform.scale(
              scale: 2.0,
              child: IconButton(
                iconSize: 10.0,
                icon: Image.asset('assets/images/ForwardIcon.png'),
                onPressed: () {
//                              var test=(musicLength.inSeconds.toDouble())-(position.inSeconds.toDouble());
//                              print(test);
                  if ((position.inSeconds.toDouble() + 15) <=
                          musicLength.inSeconds.toDouble() &&
                      position.inSeconds.toDouble() + 15 <
                          musicLength.inSeconds - 15) {
                    //    print('position:+${position.inSeconds.toDouble()+15}');
                    //  print('musiclength:+${musicLength.inSeconds.toDouble()}');
                    _player.seek(Duration(seconds: position.inSeconds + 15));
                  } else {
                    _player.seek(Duration(seconds: musicLength.inSeconds));
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }

}
//
//appBar: AppBar(
//automaticallyImplyLeading: false,
//elevation: 0,
//backgroundColor: Colors.transparent,
//title: Row(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Transform.scale(
//scale: 2.0,
//child: IconButton(
//iconSize: 10.0,
//icon: Image.asset('assets/images/BackArrowIcon.png'),
//onPressed: () {},
//),
//),
//]),
//actions: [
//Transform.scale(
//scale: 1.0,
//child: IconButton(
//iconSize: 10.0,
//icon: Image.asset('assets/images/ShareIcon.png'),
//onPressed: () {},
//),
//),
//Transform.scale(
//scale: 1.0,
//child: IconButton(
//iconSize: 10.0,
//icon: Image.asset('assets/images/BookmarkIcon.png'),
//onPressed: () {
//
//},
//),
//)
//],
//centerTitle: false,
//),
