// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, no_leading_underscores_for_local_identifiers

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojolo/Confessions.dart';
import 'package:mojolo/Discover.dart';
import 'package:mojolo/Home.dart';
import 'package:mojolo/Profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:chatview/chatview.dart';

int pageindex = 0;

class VideoPickerButton extends StatefulWidget {
  @override
  _VideoPickerButtonState createState() => _VideoPickerButtonState();
}

class _VideoPickerButtonState extends State<VideoPickerButton> {
  late String _filePath;

  void _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );
      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });
      }
    } catch (e) {
      print('Error picking video file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        width: width * 0.1,
        height: height * 0.05,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Pick Video'),
            ),
            if (_filePath != null) Text('Selected file: $_filePath'),
          ],
        ));
  }
}

class Slide extends StatefulWidget {
  Slide({super.key, this.title});
  String? title;
  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  double _sliderValue = 1;
  var sliders = [];
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.redAccent,
                    inactiveTrackColor: Colors.redAccent,
                    trackHeight: 0.1,
                    thumbColor: Colors.white,
                    valueIndicatorColor: Colors.redAccent,
                    overlayColor: Colors.white.withAlpha(1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${widget.title} ${_sliderValue.round()}%",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      SfSlider(
                        min: 0,
                        max: 100,
                        showLabels: true,
                        activeColor: Colors.redAccent,
                        value: _sliderValue,
                        onChanged: (v) {
                          setState(() {
                            _sliderValue = v;
                          });
                        },
                      ),
                    ],
                  )));
        });
  }
}

class Explore extends StatefulWidget {
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool _isTextFieldOpen = false;

  TextEditingController ratingcon =
      TextEditingController(text: "Add New Category!");
  String newrating = "";
  TextEditingController newmessagecon = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List images = [1, 2, 3, 4];
    String ratings = "off";
    var list = [
      Text(
        "Scroll",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "How Interested Are you?",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "Comfort",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "Are you Compatible?",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "Attraction",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "Conversation",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "Patience",
      ),
      const SizedBox(
        height: 25,
      ),
      Slide(
        title: "CRINGE",
      ),
    ];
    List<Widget> pages = [ListOfChats(), Discovery(), Confessions(), Profile()];
    return SafeArea(
        child: Scaffold(
      //resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 1000),
        animationCurve: Curves.decelerate,

        color: Colors.black,
        height: 50,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        //height: 60,
        items: [
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Image.asset(
                "assets/icons/home.png",
                width: width * 0.1,
                color: Colors.red,
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Image.asset("assets/icons/searchlove.png",
                  width: width * 0.1, color: Colors.red)),
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Image.asset(
                "assets/icons/confession.png",
                width: width * 0.1,
                color: Colors.red,
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Image.asset(
                "assets/icons/profile.png",
                width: width * 0.1,
                color: Colors.red,
              )),
        ],
        onTap: (index) {
          setState(() {
            pageindex = index;
          });
        },
      ),
      backgroundColor: Colors.transparent,
      body: pages[pageindex],
    ));
  }
}

class ChatPanel extends StatefulWidget {
  const ChatPanel({super.key});

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  var list = [
    Text(
      "Scroll",
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "How Interested Are you?",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "Comfort",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "Are you Compatible?",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "Attraction",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "Conversation",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "Patience",
    ),
    const SizedBox(
      height: 25,
    ),
    Slide(
      title: "CRINGE",
    ),
  ];
  final PanelController _pc = PanelController();
  PanelState panelstate = PanelState.CLOSED;
  var text = "";

  @override
  void initState() {
    super.initState();
  }

  int index = 1;

  var chatscroll = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    TextEditingController tc = TextEditingController();

    return Container();
  }
}

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, this.messages, this.scrollcontroller, this.ratings});

  ScrollController? scrollcontroller;
  List? messages;
  List<Widget>? ratings;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<Message> initialMessageList = [
      Message(id: '1', message: "Hi", createdAt: DateTime.now(), sendBy: '#1'),
      Message(id: '2', message: "Hi", createdAt: DateTime.now(), sendBy: '#2'),
    ];
    final chatcon = ChatController(
        initialMessageList: initialMessageList,
        scrollController: ScrollController(),
        chatUsers: [
          ChatUser(id: '#1', name: "luke"),
          ChatUser(id: '#2', name: "steph")
        ]);
    return GlassContainer(
        radius: BorderRadius.circular(45),
        shadowColor: Colors.transparent,
        contColor: Colors.black,
        contHeight: height * 0.65,
        borderRadiusColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTapDown: (v) {},
              child: Container(
                color: Colors.black,
                height: height * 0.06,
                width: width,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "  Chat  ",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      Image.asset(
                        "assets/icons/lovechat.png",
                        width: width * 0.1,
                        color: Colors.white,
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GlassContainer(
              contColor: Colors.transparent,
              shadowColor: Colors.transparent,
              borderRadiusColor: Colors.redAccent,
              contHeight: height * 0.08,
              radius: BorderRadius.circular(45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: GlassContainer(
                        contColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        borderRadiusColor: Colors.redAccent,
                        contHeight: height * 0.08,
                        contWidth: width * 0.16,
                        radius: BorderRadius.circular(350),
                        child: Image.asset(
                          "assets/3.jpg",
                          height: height * 0.1,
                          width: width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Text(
                      "Pretty Rumpedi",
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Text(
                    "Rating:",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Save Ratings",
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                      ))
                                ],
                                insetPadding: EdgeInsets.zero,
                                title: GlassContainer(
                                    contColor: Colors.redAccent,
                                    borderRadiusColor: Colors.redAccent,
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "You Can Constanly Update your ratings",
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ))),
                                content: GlassContainer(
                                    contWidth: width,
                                    radius: BorderRadius.circular(50),
                                    borderRadiusColor: Colors.transparent,
                                    contColor: Colors.black,
                                    shadowColor: Colors.transparent,
                                    child: Stack(
                                      children: [
                                        SingleChildScrollView(
                                            child: Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: height * 0.05,
                                                  ),
                                                  Ratings(
                                                    ratinglist: widget.ratings,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                      ],
                                    )),
                              );
                            },
                          );
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10, top: 0),
                              child: GlassContainer(
                                contColor: Colors.redAccent,
                                shadowColor: Colors.transparent,
                                borderRadiusColor: Colors.redAccent,
                                contHeight: height * 0.04,
                                contWidth: width * 0.08,
                                radius: BorderRadius.circular(350),
                              ),
                            )),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                height: height * 0.55,
                child: ChatView(
                  chatController: chatcon,
                  chatViewState: ChatViewState.hasMessages,
                  currentUser: ChatUser(id: '#1', name: "luke"),
                  onSendTap: (message, replyMessage, messageType) {
                    return;
                  },
                )),
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 45, top: 35),
                        child: GlassContainer(
                          contColor: Colors.redAccent,
                          shadowColor: Colors.transparent,
                          borderRadiusColor: Colors.redAccent,
                          contHeight: height * 0.04,
                          contWidth: width * 0.08,
                          radius: BorderRadius.circular(350),
                        ),
                      )),
                ))
          ],
        ));
  }
}

class AddRatingCat extends StatefulWidget {
  AddRatingCat({super.key, required this.addfunc});
  var addfunc = () {};
  @override
  State<AddRatingCat> createState() => _AddRatingCatState();
}

class _AddRatingCatState extends State<AddRatingCat> {
  TextEditingController ratingcon =
      TextEditingController(text: "Add New Category!");
  String newrating = "";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String ratings = "off";
    return AlertDialog(
      backgroundColor: Colors.transparent,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: widget.addfunc,
            child: Text("Add Category"))
      ],
      insetPadding: EdgeInsets.zero,
      content: GlassContainer(
        contHeight: height * 0.05,
        radius: BorderRadius.circular(50),
        contColor: Colors.redAccent,
        shadowColor: Colors.transparent,
        borderRadiusColor: Colors.transparent,
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          controller: ratingcon,
          onChanged: (value) {
            setState(() {
              newrating = value;
            });
          },
        ),
      ),
    );
  }
}

class GlassCons extends StatefulWidget {
  GlassCons({super.key, this.titles, this.descriptions, this.icons});
  List? titles;
  List? descriptions;
  List? icons;
  @override
  State<GlassCons> createState() => _GlassConsState();
}

class _GlassConsState extends State<GlassCons> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.25,
        width: width,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                width: width * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/${widget.icons![index]}.png",
                      width: width * 0.18,
                      color: Colors.red,
                    ),
                    Center(
                      child: Text(
                        "${widget.titles![index]}  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "${widget.descriptions![index]}  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: width * 0.1,
                ),
            itemCount: widget.descriptions!.length));
  }
}

class Ratings extends StatefulWidget {
  Ratings({super.key, this.ratinglist});
  List<Widget>? ratinglist;
  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  @override
  Widget build(BuildContext context) {
    return Column(children: widget.ratinglist!);
  }
}
