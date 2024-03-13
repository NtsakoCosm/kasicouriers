// ignore_for_file: prefer_const_constructors

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.name, this.pp, this.chatcon});
  String? pp;
  var chatcon;
  String? name;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ChatView(
              chatController: widget.chatcon,
              featureActiveConfig: FeatureActiveConfig(

              ),
              appBar:GlassContainer(
                borderRadiusColor: Colors.white,
                shadowColor: Colors.transparent,
                contColor: Colors.transparent,
                contWidth: width,
                contHeight: height*0.08,
                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //SizedBox(width: width*0.01,),
                                AvatarGlow(
                                  startDelay:
                                      const Duration(milliseconds: 1000),
                                  glowColor: Colors.black,
                                  glowShape: BoxShape.circle,
                                  animate:true,
                                  curve: Curves.fastOutSlowIn,
                                  child: Material(
                                    elevation: 1.0,
                                    shape: CircleBorder(),
                                    color: Colors.transparent,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(widget.pp!),
                                      radius: 25.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),

                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "${widget.name}",
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 21,
                                              letterSpacing: 3,
                                              fontWeight: FontWeight.w300),
                                        )),
                                    
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),

                                Image.network("https://img1.wikia.nocookie.net/__cb20120721162015/pocketplanes/images/5/55/Online_status.png",
                                      
                                  height: height * 0.02,
                                  width: width * 0.04,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                )

                                //Icon(Icons.adjust_outlined)
                              ])),
                        
              sendMessageConfig: SendMessageConfiguration(
                  textFieldBackgroundColor: Colors.black,
                  replyMessageColor: Colors.white,
                  sendButtonIcon: Icon(
                    Icons.send_outlined,
                    color: Colors.redAccent,
                  ),
                  voiceRecordingConfiguration: VoiceRecordingConfiguration(
                      backgroundColor: Colors.transparent,
                      recorderIconColor: Colors.redAccent,
                      waveStyle: WaveStyle(
                          waveColor: Colors.redAccent,
                          extendWaveform: true,
                          backgroundColor: Colors.transparent,
                          showMiddleLine: false),
                      micIcon: Icon(
                        Icons.mic_external_on_outlined,
                        color: Colors.redAccent,
                      )),
                  imagePickerIconsConfig: ImagePickerIconsConfiguration(
                    cameraIconColor: Colors.redAccent,
                    galleryIconColor: Colors.redAccent,
                  )),
              chatBubbleConfig: ChatBubbleConfiguration(
                  inComingChatBubbleConfig: ChatBubble(
                      color: Colors.redAccent,
                      textStyle: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 3,
                          wordSpacing: 2)),
                  outgoingChatBubbleConfig: ChatBubble(
                      color: Colors.black,
                      textStyle: GoogleFonts.lato(
                          color: Colors.white,
                          letterSpacing: 3,
                          wordSpacing: 2))),
              chatBackgroundConfig: ChatBackgroundConfiguration(
                  backgroundColor: Colors.redAccent),
              chatViewState: widget.chatcon.initialMessageList != 0? ChatViewState.hasMessages : ChatViewState.noData ,
              currentUser: ChatUser(id: '#1', name: "me"),
              onSendTap: (message, replyMessage, messageType) {
                setState(() {
                  final id = int.parse(widget.chatcon.initialMessageList.last.id) + 1;
                  widget.
                  chatcon.initialMessageList.add(
                    Message(
                        id: '$id',
                        message: message,
                        replyMessage: replyMessage,
                        messageType: messageType,
                        createdAt: DateTime.now(),
                        sendBy: "#1"),
                  );
                });
              },

              //Chat Screen
            )));
  }
}

class ListOfChats extends StatefulWidget {
  const ListOfChats({super.key});

  @override
  State<ListOfChats> createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool newmessage = true;
    return Container(
      height: height,
      color: Colors.redAccent,
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.005,
          ),
          Center(
            child: Text(
              "  Chat",
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 22),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Container(
              height: height * 0.9,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var names = ["Lindi", "Hope", "Khumo"];
                    var pps = [
                      "https://images.unsplash.com/photo-1593878024377-b38927fc7689?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmxhY2slMjBnaXJsfGVufDB8fDB8fHww",
                      "https://images.unsplash.com/photo-1589156215870-a324614b3fff?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      "https://images.unsplash.com/photo-1594737997205-89877cb12185?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ];

                    List<List<Message>> initialMessageList = [
                      [
                        Message(
                            id: '1',
                            message:
                                "Hi, Saw you by the station, need a pick up?",
                            createdAt:
                                DateTime.now().subtract(Duration(minutes: 2)),
                            sendBy: '#1'),
                        Message(
                            id: "2",
                            message: "Hi, yea, sure, thanks!",
                            createdAt: DateTime.now(),
                            sendBy: '#2'),
                      ],
                      [
                        Message(
                            id: '1',
                            message:
                                "I Thought we had Plans today, what happend?",
                            createdAt:
                                DateTime.now().subtract(Duration(minutes: 2)),
                            sendBy: '#2'),
                        Message(
                            id: "2",
                            message: "Work got hectic,I'll make it up to you",
                            createdAt: DateTime.now(),
                            sendBy: '#1'),
                      ],
                      [
                        Message(
                            id: '1',
                            message:
                                "Hey, Saw your profile, thought we'd enjoy each other's company",
                            createdAt:
                                DateTime.now().subtract(Duration(minutes: 2)),
                            sendBy: '#1'),
                        Message(
                            id: "2",
                            message: "Sure, when would you like to link?",
                            createdAt: DateTime.now(),
                            sendBy: '#2'),
                      ],
                    ];
                    var con = ScrollController();
                    var chatcon = ChatController(
                        initialMessageList: initialMessageList[index],
                        scrollController: con,
                        chatUsers: [
                          ChatUser(
                              id: '#1',
                              name: "me",
                              profilePhoto:
                                  "https://images.pistonheads.com/nimg/46575/blobid0.jpg"),
                          ChatUser(
                              id: '#2',
                              name: "${names[index]}",
                              profilePhoto: "${pps[index]}")
                        ]);
                    
                    return GlassContainer(
                        contHeight: height * 0.08,
                        contWidth: width,
                        shadowColor: Colors.transparent,
                        contColor: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomePage(
                                  name: names[index], pp: pps[index],chatcon: chatcon,);
                            }));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //SizedBox(width: width*0.01,),
                                AvatarGlow(
                                  startDelay:
                                      const Duration(milliseconds: 1000),
                                  glowColor: Colors.white,
                                  glowShape: BoxShape.circle,
                                  animate: index != 1 ? newmessage : false,
                                  curve: Curves.fastOutSlowIn,
                                  child: Material(
                                    elevation: 1.0,
                                    shape: CircleBorder(),
                                    color: Colors.transparent,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(pps[index]),
                                      radius: 25.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),

                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "${names[index]}",
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 21,
                                              letterSpacing: 3,
                                              fontWeight: FontWeight.w300),
                                        )),
                                    Text(index != 1
                                        ? "1 New Message(s)"
                                        : "0 New messages"),
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),

                                Image.network(
                                  index != 1
                                      ? "https://img1.wikia.nocookie.net/__cb20120721162015/pocketplanes/images/5/55/Online_status.png"
                                      : "https://static.thenounproject.com/png/2330407-200.png",
                                  height: height * 0.02,
                                  width: width * 0.04,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                )

                                //Icon(Icons.adjust_outlined)
                              ]),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.03,
                    );
                  },
                  itemCount: 3))
        ],
      )),
    );
  }
}
