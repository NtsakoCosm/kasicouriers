// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:math';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojolo/ChatSingleton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:quickalert/quickalert.dart';
import 'package:counter_button/counter_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Home.dart';
import 'dialogues.dart';

class Discovery extends StatefulWidget {
  const Discovery({super.key});

  @override
  State<Discovery> createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  bool liked = false;
  bool refresh = false;
  double h = 0;
  double w = 0;
  var desirepanelstate = PanelState.CLOSED;
  var desirepanel = PanelController();
  var shpanelstate = PanelState.CLOSED;
  var shpanel = PanelController();
  var favouritepanelstate = PanelState.CLOSED;
  var favouritepanel = PanelController();
  var intentionpanelstate = PanelState.CLOSED;
  var intentionpanel = PanelController();
  var pcpanelstate = PanelState.CLOSED;
  var pcpanel = PanelController();
  var biopanelstate = PanelState.CLOSED;
  var biopanel = PanelController();

  @override
  Widget build(BuildContext context) {
    var con = SwiperController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var images = [1, 2, 3, 4];
    TextEditingController messagecontroller =
        TextEditingController(text: "Buy Yourself Somthing Nice...");
    var swiper = Swiper(
      controller: con,
      itemWidth: width * 0.95,
      itemHeight: height * 0.5,
      layout: SwiperLayout.STACK,
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox.fromSize(
                size: Size.fromRadius(25),
                child: Stack(
                  children: [
                    //Photo Stack
                    Container(
                      width: width * 1,
                      child: Image.asset(
                        "assets/${images[index]}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 15),
                          child: Container(
                            height: height * 0.04,
                            width: width * 0.08,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (build) {
                                      return POPup();
                                    });
                              },
                              child: Container(),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(15),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(200.0),
                                          side: BorderSide(
                                              color: Colors.transparent)))),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15, right: 20),
                          child: Container(
                            height: height * 0.04,
                            width: width * 0.08,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (build) {
                                      return GiftPopup();
                                    });
                              },
                              child: Container(),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(15),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(200.0),
                                          side: BorderSide(
                                              color: Colors.transparent)))),
                            ),
                          ),
                        )),
                  
                  ],
                )));
      },
      itemCount: 4,
      control:
          SwiperControl(color: Colors.transparent, disableColor: Colors.black),
    );
    var h = height * 0.45;
    double fontsize = 20;
    //Desires
    return SlidingUpPanel(
      minHeight: height * 0.1,
      maxHeight: height * 0.98,
      controller: desirepanel,
      padding: EdgeInsets.only(left: 0, right: 0),
      color: Colors.transparent,
      boxShadow: const [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(1, 1),
          spreadRadius: 15,
          blurRadius: 15,
        )
      ],
      //Spending Habits
      body: SlidingUpPanel(
        minHeight: height * 0.25,
        maxHeight: height * 0.98,
        controller: shpanel,

        padding: EdgeInsets.only(left: 5, right: 5),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(1, 1),
            spreadRadius: 15,
            blurRadius: 15,
          )
        ],
        //Favourites
        body: SlidingUpPanel(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 5, right: 5),
          minHeight: height * 0.31,
          maxHeight: height * 0.98,
          controller: favouritepanel,

          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              spreadRadius: 15,
              blurRadius: 15,
            )
          ],
          //Intentions
          body: SlidingUpPanel(
            minHeight: height * 0.37,
            maxHeight: height * 0.98,
            controller: intentionpanel,

            padding: EdgeInsets.only(left: 5, right: 5),
            color: Colors.transparent,
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(1, 1),
                spreadRadius: 15,
                blurRadius: 15,
              )
            ],

            //Bio
            body: SlidingUpPanel(
              minHeight: height * 0.43,
              maxHeight: height * 0.98,
              controller: pcpanel,

              padding: EdgeInsets.only(left: 5, right: 5),
              color: Colors.transparent,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  spreadRadius: 15,
                  blurRadius: 15,
                )
              ],

              //Public Conffessions
              body: SlidingUpPanel(
                minHeight: height * 0.49,
                maxHeight: height * 0.98,
                controller: biopanel,

                padding: EdgeInsets.only(left: 5, right: 5),
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1, 1),
                    spreadRadius: 15,
                    blurRadius: 15,
                  )
                ],

                //Global Body:
                body: Container(
                    //height: height * 0.82,
                    alignment: Alignment.topCenter,
                    color: Colors.redAccent,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: swiper,
                            height: height * 0.4,
                          ),
                          //SizedBox(height: height*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      child: Image.asset(
                                    "assets/icons/cancel6.png",
                                    height: height * 0.08,
                                  ))),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      liked = !liked;
                                    });
                                  },
                                  child: Tooltip(
                                      message: "Send to likes",
                                      child: Image.asset(
                                        liked != true
                                            ? "assets/icons/heart.png"
                                            : "assets/icons/cance5.png",
                                        height: height * 0.08,
                                      ))),
                              GestureDetector(
                                  onTap: () {
                                     Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                  var chatcon = ChatController(
                                    scrollController: ScrollController(),
                                    initialMessageList: [
                              
                                    ],
                                    chatUsers: [
                                          ChatUser(
                                              id: '#1',
                                              name: "me",
                                              profilePhoto:
                                                  "https://images.pistonheads.com/nimg/46575/blobid0.jpg"),
                                          ChatUser(
                                              id: '#2',
                                              name: "Pretty",
                                              profilePhoto:
                                                  "https://images.pistonheads.com/nimg/46575/blobid0.jpg"),
                                        ],
                                    
                                  );

                              return HomePage(name: "Pretty",pp:"https://i.pinimg.com/originals/8b/ec/ef/8becef5394fa0e8f1fe50b841a8e0e60.png",chatcon: chatcon,);
                            }));
                                  },
                                  child: Container(
                                      child: Image.asset(
                                    "assets/icons/chat4.png",
                                    height: height * 0.11,
                                  ))),
                              GestureDetector(
                                onTap: () {},
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 0, left: 0),
                                      child: Container(
                                        height: height * 0.1,
                                        width: width * 0.24,
                                        child: ElevatedButton(
                                          onPressed: () {
                                          
                                          },
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(10),
                                              shadowColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.transparent),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.transparent),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(200.0),
                                                      side: BorderSide(color: Colors.transparent)))),
                                          child: Image.asset(
                                            "assets/icons/next2.png",
                                            height: height * 0.08,
                                            width: width * 0.18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ])),
                //Bio
                panelBuilder: (sc) {
                  return GlassContainer(
                      radius: BorderRadius.circular(50),
                      contColor: Colors.redAccent,
                      shadowColor: Colors.transparent,
                      borderRadiusColor: Colors.redAccent,
                      child: ListView(
                        controller: sc,
                        shrinkWrap: true,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  Bio  ",
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                                Image.asset(
                                  "assets/icons/profile.png",
                                  width: width * 0.1,
                                  color: Colors.black,
                                ),
                              ]),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Text(
                            " Pretty Rampedi ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Text(
                            " Pretoria East, Gauteng ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Text(
                            "About Me:",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              """Hi! My name is Pretty, and I am brand new to online dating.While I’m still figuring this all out,here’s something I know for sure—I’m excited to be here! The chance to meet unique, engaging, and interesting women is pretty dang neat. If you think you might fit that mold, drop me a message.I work in the finance industry. And while I like to work hard, I make sure to leave time to enjoy life. I’m a fan of wine, movies, hiking, and getting out of town for the weekend. Let’s chat and see if maybe we’re a good fit!""",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.55,
                          ),
                        ],
                      ));
                },
              ),

              //  Public Conffessions
              panelBuilder: (sc) {
                return GlassContainer(
                    radius: BorderRadius.circular(50),
                    contColor: Colors.redAccent,
                    shadowColor: Colors.transparent,
                    borderRadiusColor: Colors.redAccent,
                    child: ListView(
                      controller: sc,
                      shrinkWrap: true,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "  Public Confessions  ",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              ),
                              Image.asset(
                                "assets/icons/confession.png",
                                width: width * 0.1,
                                color: Colors.black,
                              ),
                            ]),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Center(
                child:  ToggleSwitch(
                minWidth: width*0.7,
                initialLabelIndex: 0,
                activeBgColor: [Colors.black],
                totalSwitches: 1,
                labels: [ "Public"],
                onToggle: (i) {
                 
                },
              ),
            ),
            SizedBox(
                          height: height * 0.05,
                        ),

                        
                        ListView.separated(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemBuilder: (context, index) {
                              return GlassContainer(
                                  contHeight: height * 0.23,
                                  contWidth: width * 0.95,
                                  radius: BorderRadius.circular(12),
                                  contColor: Colors.redAccent,
                                  borderRadiusColor: Colors.white38,
                                  child: Center(
                                      child: Text(
                                          "My ex got me a promise ring and I tried to throw it away when we broke up. But my dad wouldn't let meand now he wears it as a pinky ring. - 16 April 2020",
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 16,
                                              letterSpacing: 2,
                                              wordSpacing: 2,
                                              fontWeight: FontWeight.w400))));
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: Colors.transparent,
                                height: height * 0.05,
                              );
                            },
                            itemCount: 5),

                        SizedBox(
                          height: height * 0.45,
                        ),
                      ],
                    ));
              },
            ),

            //Intentions
            panelBuilder: (sc) {
              return GlassContainer(
                  radius: BorderRadius.circular(50),
                  contColor: Colors.redAccent,
                  shadowColor: Colors.transparent,
                  borderRadiusColor: Colors.redAccent,
                  child: ListView(
                    controller: sc,
                    shrinkWrap: true,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Intentions  ",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                            Image.asset(
                              "assets/icons/intention.png",
                              width: width * 0.1,
                              color: Colors.black,
                            ),
                          ]),
                      SizedBox(
                        height: height * 0.05,
                      ),

                      //Intentions
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var intentions = [
                              "Situationship",
                              "Dating For Marriage",
                              "Casual Dating",
                              "Istembu",
                              "One Night Stand",
                              "Flings",
                            ];
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${intentions[index]}",
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Image.asset(
                                    "assets/icons/tick.png",
                                    width: width * 0.08,
                                    color: Colors.black,
                                  ),
                                ]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: height * 0.025,
                            );
                          },
                          itemCount: 6),

                      SizedBox(
                        height: height * 0.32,
                      ),
                    ],
                  ));
            },
          ),
          //Favourites
          panelBuilder: (sc) {
            return GlassContainer(
                radius: BorderRadius.circular(50),
                contColor: Colors.redAccent,
                shadowColor: Colors.transparent,
                borderRadiusColor: Colors.redAccent,
                child: ListView(
                  controller: sc,
                  shrinkWrap: true,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "  Favourites  ",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      Image.asset(
                        "assets/icons/rose.png",
                        width: width * 0.14,
                        color: Colors.black,
                      ),
                    ]),
                    SizedBox(
                      height: height * 0.05,
                    ),

                    //Favourite Drinks
                    GlassContainer(
                      contColor: Colors.black,
                      borderRadiusColor: Colors.black,
                      radius: BorderRadius.circular(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Favourite Drinks",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            Image.asset(
                              "assets/icons/drink.png",
                              width: width * 0.1,
                              color: Colors.redAccent,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          var names = [
                            "Giniologist",
                            "Cosmopoliten",
                            "Sex on the beach",
                            "Sky Vodka",
                          ];
                          var price = [250, 200, 150, 125];
                          return GlassContainer(
                            radius: BorderRadius.circular(35),
                            contHeight: height * 0.07,
                            contWidth: width * 0.95,
                            contColor: Colors.white,
                            borderRadiusColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (bulder) {
                                          return BuyThis(
                                              name: names[index],
                                              price: price[index],
                                              cat: "Drinks");
                                        });
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 0),
                                        child: GlassContainer(
                                          contColor: Colors.redAccent,
                                          shadowColor: Colors.transparent,
                                          borderRadiusColor: Colors.redAccent,
                                          contHeight: height * 0.04,
                                          contWidth: width * 0.08,
                                          radius: BorderRadius.circular(350),
                                        ),
                                      )),
                                ),
                                Text(
                                  "${names[index]} ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "  R${price[index]}  ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25,
                          );
                        },
                        itemCount: 4),
                    SizedBox(
                      height: height * 0.05,
                    ),

                    //Favourite Meals
                    GlassContainer(
                      contColor: Colors.black,
                      borderRadiusColor: Colors.black,
                      radius: BorderRadius.circular(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Favourite Meals",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/icons/food.png",
                              width: width * 0.1,
                              color: Colors.redAccent,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          var names = [
                            "Sphatlo",
                            "Chicken Licken Wings",
                            "Debonairs Pizza",
                            "Big Mac",
                          ];
                          var price = [50, 280, 250, 120];
                          return GlassContainer(
                            radius: BorderRadius.circular(35),
                            contHeight: height * 0.07,
                            contWidth: width * 0.95,
                            contColor: Colors.white,
                            borderRadiusColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (bulder) {
                                          return BuyThis(
                                              name: names[index],
                                              price: price[index],
                                              cat: "Food");
                                        });
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 0),
                                        child: GlassContainer(
                                          contColor: Colors.redAccent,
                                          shadowColor: Colors.transparent,
                                          borderRadiusColor: Colors.redAccent,
                                          contHeight: height * 0.04,
                                          contWidth: width * 0.08,
                                          radius: BorderRadius.circular(350),
                                        ),
                                      )),
                                ),
                                Text(
                                  " ${names[index]}  ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "  R${price[index]}  ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25,
                          );
                        },
                        itemCount: 4),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    //Clothing Favourites
                    GlassContainer(
                      contColor: Colors.black,
                      borderRadiusColor: Colors.black,
                      radius: BorderRadius.circular(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Favourite Clothing Items",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/icons/clothing.png",
                              width: width * 0.1,
                              color: Colors.redAccent,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          var names = [
                            "MSCHF Boots",
                            "Red Bottoms",
                            "LV Bag",
                            "Gucci Slippers",
                          ];
                          var price = [11250, 25250, 25250, 5250];
                          return GlassContainer(
                            radius: BorderRadius.circular(35),
                            contHeight: height * 0.07,
                            contWidth: width * 0.95,
                            contColor: Colors.white,
                            borderRadiusColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (bulder) {
                                          return BuyThis(
                                              name: names[index],
                                              price: price[index],
                                              cat: "Clothes");
                                        });
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 0),
                                        child: GlassContainer(
                                          contColor: Colors.redAccent,
                                          shadowColor: Colors.transparent,
                                          borderRadiusColor: Colors.redAccent,
                                          contHeight: height * 0.04,
                                          contWidth: width * 0.08,
                                          radius: BorderRadius.circular(350),
                                        ),
                                      )),
                                ),
                                Text(
                                  "${names[index]}",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "R${price[index]}",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25,
                          );
                        },
                        itemCount: 4),
                    SizedBox(
                      height: height * 0.05,
                    ),

                    //Favourites Experiences
                    GlassContainer(
                      contColor: Colors.black,
                      borderRadiusColor: Colors.black,
                      radius: BorderRadius.circular(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Favourite Experiences",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/icons/spirit.png",
                              width: width * 0.1,
                              color: Colors.redAccent,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          var names = [
                            "Sky Divining",
                            "Picnic Dates",
                            "Sho Madjozi Concerts",
                            "Walks on the Beach"
                          ];
                          var price = [250, 750, 650, 0];
                          return GlassContainer(
                            radius: BorderRadius.circular(35),
                            contHeight: height * 0.07,
                            contWidth: width * 0.95,
                            contColor: Colors.white,
                            borderRadiusColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (bulder) {
                                          return BuyThis(
                                              name: names[index],
                                              price: price[index],
                                              cat: "Exp");
                                        });
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 0),
                                        child: GlassContainer(
                                          contColor: Colors.redAccent,
                                          shadowColor: Colors.transparent,
                                          borderRadiusColor: Colors.redAccent,
                                          contHeight: height * 0.04,
                                          contWidth: width * 0.08,
                                          radius: BorderRadius.circular(350),
                                        ),
                                      )),
                                ),
                                Text(
                                  " ${names[index]} ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "  R${price[index]}  ",
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25,
                          );
                        },
                        itemCount: 4),

                    SizedBox(
                      height: height * 0.32,
                    ),
                  ],
                ));
          },
        ),

        //Money habbits
        panelBuilder: (sc) {
          return GlassContainer(
              radius: BorderRadius.circular(50),
              contColor: Colors.redAccent,
              shadowColor: Colors.transparent,
              borderRadiusColor: Colors.redAccent,
              child: ListView(
                controller: sc,
                shrinkWrap: true,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "  Spending Habits  ",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    Image.asset(
                      "assets/icons/money3.png",
                      width: width * 0.11,
                      color: Colors.black,
                    ),
                  ]),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  //GirlFriend Allowance
                  GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  Girlfriend Allowance  ",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/money.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Text(
                    "R3500",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),

                  //Monthly Bills
                  GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  Monthly Bills  ",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/money.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemBuilder: (context, index) {
                        var names = [
                          "Hair",
                          "Make Up",
                          "Toiletries",
                          "Data",
                        ];
                        var price = [150, 100, 250, 150];
                        return GlassContainer(
                          radius: BorderRadius.circular(35),
                          contHeight: height * 0.07,
                          contWidth: width * 0.95,
                          contColor: Colors.white,
                          borderRadiusColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return BuyThis(
                                            name: names[index],
                                            price: price[index],
                                            cat: "Mbills");
                                      });
                                },
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 0, top: 0),
                                      child: GlassContainer(
                                        contColor: Colors.redAccent,
                                        shadowColor: Colors.transparent,
                                        borderRadiusColor: Colors.redAccent,
                                        contHeight: height * 0.04,
                                        contWidth: width * 0.08,
                                        radius: BorderRadius.circular(350),
                                      ),
                                    )),
                              ),
                              Text(
                                "  ${names[index]}",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "  R${price[index]}  ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: 4),
                  SizedBox(
                    height: height * 0.05,
                  ),

                  //Average Cost of Outfit
                  GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Average Cost of Outfit",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/money.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemBuilder: (context, index) {
                        var names = [
                          "Shoes",
                          "Make Up",
                          "Dress",
                          "Jewellery",
                        ];
                        var price = [450, 100, 250, 150];
                        return GlassContainer(
                          radius: BorderRadius.circular(35),
                          contHeight: height * 0.07,
                          contWidth: width * 0.95,
                          contColor: Colors.white,
                          borderRadiusColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                   showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return BuyThis(
                                            name: names[index],
                                            price: price[index],
                                            cat: "Aoutfit");
                                      });
                                },
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 0, top: 0),
                                      child: GlassContainer(
                                        contColor: Colors.redAccent,
                                        shadowColor: Colors.transparent,
                                        borderRadiusColor: Colors.redAccent,
                                        contHeight: height * 0.04,
                                        contWidth: width * 0.08,
                                        radius: BorderRadius.circular(350),
                                      ),
                                    )),
                              ),
                              Text(
                                "  ${names[index]}  ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "  R${price[index]}  ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: 4),

                  SizedBox(
                    height: height * 0.05,
                  ),
                  //Average Cost of Outfit
                  GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Average Cost of a Night Out",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/money.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemBuilder: (context, index) {
                        var names = [
                          "Uber",
                          "Drinks",
                          "Food",
                          "Airtime",
                        ];
                        var price = [250, 500, 250, 100];
                        return GlassContainer(
                          radius: BorderRadius.circular(35),
                          contHeight: height * 0.07,
                          contWidth: width * 0.95,
                          contColor: Colors.white,
                          borderRadiusColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return BuyThis(
                                            name: names[index],
                                            price: price[index],
                                            cat: "NightOut");
                                      });
                                },
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 0, top: 0),
                                      child: GlassContainer(
                                        contColor: Colors.redAccent,
                                        shadowColor: Colors.transparent,
                                        borderRadiusColor: Colors.redAccent,
                                        contHeight: height * 0.04,
                                        contWidth: width * 0.08,
                                        radius: BorderRadius.circular(350),
                                      ),
                                    )),
                              ),
                              Text(
                                "  ${names[index]}  ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "  R${price[index]}  ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: 4),

                  SizedBox(
                    height: height * 0.3,
                  ),
                ],
              ));
        },
      ),

      //Desires
      panelBuilder: (sc) {
        return GlassContainer(
            radius: BorderRadius.circular(50),
            contColor: Colors.redAccent,
            shadowColor: Colors.transparent,
            borderRadiusColor: Colors.redAccent,
            child: ListView(
              controller: sc,
              shrinkWrap: true,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "  Desires  ",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      Image.asset(
                        "assets/icons/desire.png",
                        width: width * 0.08,
                        color: Colors.black,
                      ),
                    ]),
                SizedBox(
                  height: height * 0.1,
                ),
                //Material Desire
                GlassContainer(
                  contColor: Colors.black,
                  borderRadiusColor: Colors.black,
                  radius: BorderRadius.circular(25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "  Material Desires  ",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),
                        ),
                        Image.asset(
                          "assets/icons/money2.png",
                          width: width * 0.1,
                          color: Colors.redAccent,
                        ),
                      ]),
                ),

                SizedBox(
                  height: height * 0.05,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      var desires = [
                        "Iphone 15 Pro Max",
                        "Red Bottoms",
                        "LV Bag"
                      ];
                      var prices = [12000, 7000, 18000];
                      return GlassContainer(
                        radius: BorderRadius.circular(35),
                        contHeight: height * 0.07,
                        contWidth: width * 0.95,
                        contColor: Colors.white,
                        borderRadiusColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                 showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return BuyThis(
                                            name: desires[index],
                                            price: prices[index],
                                            cat: "Mdesires");
                                      });
                              },
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 0, top: 0),
                                    child: GlassContainer(
                                      contColor: Colors.redAccent,
                                      shadowColor: Colors.transparent,
                                      borderRadiusColor: Colors.redAccent,
                                      contHeight: height * 0.04,
                                      contWidth: width * 0.08,
                                      radius: BorderRadius.circular(350),
                                    ),
                                  )),
                            ),
                            Text(
                              "  ${desires[index]}  ",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "  R${prices[index]}  ",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                    itemCount: 3),
                SizedBox(
                  height: height * 0.05,
                ),

                //Physical Desire
                GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  Physical Desires  ",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/lips.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ])),
                SizedBox(
                  height: height * 0.05,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      var desires = ["Tall", "Dark", "Big Eyes", "Fit"];

                      return GlassContainer(
                          radius: BorderRadius.circular(35),
                          contHeight: height * 0.07,
                          contWidth: width * 0.95,
                          contColor: Colors.white,
                          borderRadiusColor: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                  child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${desires[index]}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                    itemCount: 4),

                SizedBox(
                  height: height * 0.05,
                ),
                //Emotional Desire
                GlassContainer(
                    contColor: Colors.black,
                    borderRadiusColor: Colors.black,
                    radius: BorderRadius.circular(25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  Emotional Desires  ",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/spirit.png",
                            width: width * 0.1,
                            color: Colors.redAccent,
                          ),
                        ])),
                SizedBox(
                  height: height * 0.05,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      var desires = [
                        "Patience",
                        "Caring",
                        "Attentive",
                        "Straight Fowardness"
                      ];
                      return GlassContainer(
                          radius: BorderRadius.circular(35),
                          contHeight: height * 0.07,
                          contWidth: width * 0.95,
                          contColor: Colors.white,
                          borderRadiusColor: Colors.white,
                          child: Stack(
                            children: [
                             
                              Align(
                                  child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${desires[index]}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                    itemCount: 4),
                SizedBox(
                  height: height * 0.2,
                ),
              ],
            ));
      },
    );
  }
}
