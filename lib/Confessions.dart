import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojolo/dialogues.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ConfessionCard extends StatefulWidget {
  const ConfessionCard({super.key});

  @override
  State<ConfessionCard> createState() => _ConfessionCardState();
}

class _ConfessionCardState extends State<ConfessionCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GlassContainer(
      contHeight: height * 0.23,
      contWidth: width * 0.95,
      radius: BorderRadius.circular(39),
      contColor: Colors.redAccent,
      borderRadiusColor: Colors.transparent,
    );
  }
}

class Confessions extends StatefulWidget {
  const Confessions({super.key});

  @override
  State<Confessions> createState() => _ConfessionsState();
}

class _ConfessionsState extends State<Confessions> {
  List panelstates = List.generate(10, (i) {
    return PanelState.CLOSED;
  });
  @override
  Widget build(BuildContext context) {
    final controller = StreamController<bool>.broadcast();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List focusNodes = List.generate(20, ((index) {
      return FocusNode();
    }));
    List controllers = List.generate(20, ((index) {
      return PanelController();
    }));

    return SlidingUpPanel(
      defaultPanelState: panelstates[0],
      onPanelClosed: () {
        setState(() {
          panelstates[0] = PanelState.CLOSED;
        });
      },
      onPanelOpened: (() {
        setState(() {
          panelstates[0] = PanelState.OPEN;
        });
      }),
      minHeight: height * 0.1,
      maxHeight: height,
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
      //Favourites
      body: SlidingUpPanel(
        defaultPanelState: panelstates[1],
        onPanelClosed: () {
          setState(() {
            panelstates[1] = PanelState.CLOSED;
          });
        },
        onPanelOpened: (() {
          setState(() {
            panelstates[1] = PanelState.OPEN;
          });
        }),
        minHeight: height * 0.28,
        controller: controllers[0],
        maxHeight: height,
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
        body: SlidingUpPanel(
          defaultPanelState: panelstates[2],
          onPanelClosed: () {
            setState(() {
              panelstates[2] = PanelState.CLOSED;
            });
          },
          onPanelOpened: (() {
            setState(() {
              panelstates[2] = PanelState.OPEN;
            });
          }),
          minHeight: height * 0.36,
          maxHeight: height,
          controller: controllers[1],
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
          body: SlidingUpPanel(
            defaultPanelState: panelstates[0],
            onPanelClosed: () {
              setState(() {
                panelstates[3] = PanelState.CLOSED;
              });
            },
            onPanelOpened: (() {
              setState(() {
                panelstates[3] = PanelState.OPEN;
              });
            }),
            minHeight: height * 0.44,
            controller: controllers[2],
            maxHeight: height,
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
            body: SlidingUpPanel(
              defaultPanelState: panelstates[4],
              onPanelClosed: () {
                setState(() {
                  panelstates[4] = PanelState.CLOSED;
                });
              },
              onPanelOpened: (() {
                setState(() {
                  panelstates[4] = PanelState.OPEN;
                });
              }),
              minHeight: height * 0.52,
              maxHeight: height,
              controller: controllers[3],
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
              body: SlidingUpPanel(
                defaultPanelState: panelstates[6],
                onPanelClosed: () {
                  setState(() {
                    panelstates[6] = PanelState.CLOSED;
                  });
                },
                onPanelOpened: (() {
                  setState(() {
                    panelstates[6] = PanelState.OPEN;
                  });
                }),
                minHeight: height * 0.6,
                maxHeight: height,
                controller: controllers[4],
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
                body: SlidingUpPanel(
                  defaultPanelState: panelstates[7],
                  onPanelClosed: () {
                    setState(() {
                      panelstates[7] = PanelState.CLOSED;
                    });
                  },
                  onPanelOpened: (() {
                    setState(() {
                      panelstates[7] = PanelState.OPEN;
                    });
                  }),
                  minHeight: height * 0.68,
                  controller: controllers[5],
                  maxHeight: height,
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
                  body: Container(
                    color: Colors.redAccent,
                    child: Column(
                      children: [
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  Mojolo Confessions  ",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            Image.asset("assets/icons/confession.png",
                                height: height * 0.04, color: Colors.white)
                          ],
                        )),
                        Center(
                            child: Text("Trending Confessions",
                                style: GoogleFonts.lato(color: Colors.black))),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        CarouselSlider(
                            items: List.generate(3, (index) {
                              var confessions = [
                                "I have a recording of my ex crying and asking me to take her back, but i won't because she fucked up. Now, she found out.",
                                "My Husband has been making advances to my younger sister.",
                                "Just found out i was adopted , guess i won't have to worry about the feelings i have been having for my 'Not' Sister. "
                              ];
                              return GlassContainer(
                                contHeight: height * 0.23,
                                shadowColor: Colors.transparent,
                                contWidth: width * 0.95,
                                radius: BorderRadius.circular(12),
                                contColor: Colors.redAccent,
                                borderRadiusColor: Colors.white38,
                                child: Center(
                                    child: Text(confessions[index],
                                        style: GoogleFonts.lato(
                                            color: Colors.white))),
                              );
                            }),
                            options: CarouselOptions(
                              height: height * 0.23,
                              aspectRatio: 0.60,
                              viewportFraction: 0.75,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ))

                        /**/
                      ],
                    ),
                  ),

                  //Money
                  panelBuilder: (sc) {
                    return ConfessionSheet(
                        sc: sc, name: "Money", bottompad: 0.8);
                  },
                ),
                //WorkPlace
                panelBuilder: (sc) {
                  return ConfessionSheet(
                      sc: sc, name: "Work Place", bottompad: 0.7);
                },
              ),
              //ESTATE
              panelBuilder: (sc) {
                return ConfessionSheet(sc: sc, name: "Estate", bottompad: 0.6);
              },
            ),
            //Varsity
            panelBuilder: (sc) {
              return ConfessionSheet(sc: sc, name: "Varsity", bottompad: 0.5);
            },
          ),
          //Marriage
          panelBuilder: (sc) {
            return ConfessionSheet(sc: sc, name: "Marriage", bottompad: 0.4);
          },
        ),
        //Ex Confession
        panelBuilder: (sc) {
          return ConfessionSheet(sc: sc, name: "Ex", bottompad: 0.3);
        },
      ),

      //TT Confessions
      panelBuilder: (sc) {
        return ConfessionSheet(sc: sc, name: "Tlof Tlof", bottompad: 0.2);
      },
    );
  }
}

class ConfessionSheet extends StatefulWidget {
  ConfessionSheet({super.key, this.sc, this.name, this.bottompad});
  var sc;
  var bottompad;
  String? name;
  @override
  State<ConfessionSheet> createState() => _ConfessionSheetState();
}

class _ConfessionSheetState extends State<ConfessionSheet> {
  var togindex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GlassContainer(
        radius: BorderRadius.circular(50),
        contColor: Colors.redAccent,
        shadowColor: Colors.transparent,
        borderRadiusColor: Colors.redAccent,
        child: ListView(
          controller: widget.sc,
          shrinkWrap: true,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "  ${widget.name}  ",
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
           SizedBox(
            width: width*0.4,
            child:
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return ConfessionInput();
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  
                  ),
                child: Text(
                  "Confess",
                  style: GoogleFonts.lato(color: Colors.white),
                ))),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
                child:  ToggleSwitch(
                minWidth: width*0.7,
                initialLabelIndex: togindex,
                activeBgColor: [Colors.black],
                totalSwitches: 2,
                labels: ["Anonymous", "Public"],
                onToggle: (i) {
                  setState(() {
                    togindex = i!;
                  });
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
                      contWidth: width,
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
              height: height * widget.bottompad,
            ),
          ],
        ));
  }
}
