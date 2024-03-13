import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojolo/ChatSingleton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool liked = false;
  bool refresh = false;
  double h = 0;
  double w = 0;

  @override
  Widget build(BuildContext context) {
    var con = SwiperController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var images = [
      "add",
      "add",
      "add",
      "add"
    ];
    TextEditingController messagecontroller =
        TextEditingController(text: "Buy Yourself Somthing Nice...");
    var swiper = Swiper(
      controller: con,
      itemWidth: width * 0.95,
      itemHeight: height * 0.5,
      layout: SwiperLayout.DEFAULT,
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox.fromSize(
                size: Size.fromRadius(25),
                child: Stack(
                  children: [
                    //Photo Stack
                    Center(child: Container(
                      width: width * 0.5,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/icons/${images[index]}.png",
                        color: Colors.redAccent,
                        fit: BoxFit.cover,
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
        minHeight: height * 0.28,
        maxHeight: height * 0.98,
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

          minHeight: height * 0.36,
          maxHeight: height * 0.98,
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
            minHeight: height * 0.44,
            maxHeight: height * 0.98,
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
              minHeight: height * 0.52,
              maxHeight: height * 0.98,
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
                minHeight: height * 0.6,
                maxHeight: height * 0.98,
                padding: EdgeInsets.only(left: 5, right: 5),
                color: Colors.transparent,
                //Global Body:
                body: Container(
                    //height: height * 0.82,
                    alignment: Alignment.topCenter,
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: swiper,
                            height: height * 0.46,
                          ),
                          //SizedBox(height: height*0.01,),
                        ])),
                //Bio
                panelBuilder: (sc) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " Your Bio  ",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: fontsize,
                                  fontWeight: FontWeight.w300),
                            ),
                            Image.asset(
                              "assets/icons/profile.png",
                              height: height * 0.04,
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                },
              ),

              //  Public Conffessions
              panelBuilder: (sc) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Your Public Conffessions   ",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            "assets/icons/confession.png",
                            height: height * 0.04,
                          )
                        ],
                      ))
                    ],
                  ),
                );
              },
            ),

            //Intentions
            panelBuilder: (sc) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Your Intentions   ",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.w300),
                        ),
                        Image.asset(
                          "assets/icons/intention.png",
                          height: height * 0.04,
                        )
                      ],
                    ))
                  ],
                ),
              );
            },
          ),
          //Favourites
          panelBuilder: (sc) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Your Favourites   ",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: fontsize,
                            fontWeight: FontWeight.w300),
                      ),
                      Image.asset(
                        "assets/icons/rose.png",
                        height: height * 0.06,
                        color: Colors.black,
                      )
                    ],
                  ))
                ],
              ),
            );
          },
        ),

        //Money habbits
        panelBuilder: (sc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Your Spending Habits ",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: fontsize,
                          fontWeight: FontWeight.w300),
                    ),
                    Image.asset(
                      "assets/icons/money3.png",
                      height: height * 0.06,
                      color: Colors.black,
                    )
                  ],
                ))
              ],
            ),
          );
        },
      ),

      //Desires
      panelBuilder: (sc) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            children: [
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Your Desires ",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: fontsize,
                        fontWeight: FontWeight.w300),
                  ),
                  Image.asset(
                    "assets/icons/desire.png",
                    height: height * 0.04,
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
