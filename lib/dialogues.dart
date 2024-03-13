import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class POPup extends StatefulWidget {
  const POPup({super.key});

  @override
  State<POPup> createState() => _POPupState();
}

class _POPupState extends State<POPup> {
  var cardlist = <CardModel>[];
  bool liked = false;
  bool refresh = false;
  int amount = 0;
  double h = 0;
  double w = 0;
  TextEditingController cont = TextEditingController(text: " Message : ");
  TextEditingController message = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var actions = [
      Center(
        child: Container(
          // width: width * 0.4,
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {},
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Send",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    Image.asset(
                      "assets/icons/rose.png",
                      height: height * 0.025,
                      width: width * 0.075,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
        ),
      )
    ];
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      actions: amount > 0 ? actions : [],
      title: Center(
          child: Text(
        "Send Her Flowers",
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
      )),
      content: GlassContainer(
          contWidth: width,

          //contHeight: height * 0.51,
          borderRadiusColor: Colors.transparent,
          contColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        GlassContainer(
                            contWidth: width,
                            contHeight: height * 0.12,
                            radius: BorderRadius.circular(0),
                            contColor: Colors.transparent,
                            borderRadiusColor: Colors.transparent,
                            shadowBlurRadius: 15,
                            child: Center(
                                child: Stack(children: [
                              Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "assets/icons/flowermoney.jpg",
                                  width: width,
                                  height: height * 0.12,
                                  fit: BoxFit.cover,
                                ),
                              )),
                            ]))),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Column(
                          children: [
                            Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '  Amount : R${amount}  ',
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        if (amount >= 1000)
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        if (amount >= 10000)
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        if (amount >= 100000)
                                          Icon(Icons.star, color: Colors.yellow)
                                      ],
                                    ))),
                            SizedBox(height: height * 0.01),
                            Container(
                              //width: width * 0.33,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      amount += 100;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R100',
                                            style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                        ]),
                                  )),
                            ),
                            Container(
                              //width: width * 0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 1000;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R1 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  )),
                            ),
                            Container(
                              //width: width * 0.51,
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 10000;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ' +R10 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  )),
                            ),
                            SizedBox(
                              height: height * 0.0,
                            ),
                            Container(
                              //width: width * 0.7,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 100000;
                                    });
                                  },
                                  child: Center(
                                      child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R100 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  ))),
                            ),
                            SizedBox(
                              height: height * 0.025,
                            ),
                            GlassContainer(
                              contHeight: height * 0.07,
                              borderRadiusColor: Colors.redAccent,
                              shadowColor: Colors.transparent,
                              shadowBlurRadius: 450,
                              shadowSpreadRadius: 1,
                              contColor: Colors.transparent,
                              radius: BorderRadius.circular(45),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        width: width * 0.85,
                                        child: TextField(
                                            cursorColor: Colors.redAccent,
                                            decoration: const InputDecoration(
                                              hintText:
                                                  "Get yourself something nice.",
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            controller: message,
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300))),
                                  ]),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class SendThis extends StatefulWidget {
  SendThis({super.key});

  @override
  State<SendThis> createState() => _SendThisState();
}

class _SendThisState extends State<SendThis> {
  var cardlist = <CardModel>[];
  bool liked = false;
  bool refresh = false;
  int amount = 0;
  double h = 0;
  double w = 0;
  TextEditingController cont = TextEditingController(text: " Message : ");
  TextEditingController message = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var actions = [
      Center(
        child: Container(
          // width: width * 0.4,
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {},
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Send",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    Image.asset(
                      "assets/icons/rose.png",
                      height: height * 0.025,
                      width: width * 0.075,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
        ),
      )
    ];
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      actions: amount > 0 ? actions : [],
      title: Center(
          child: Text(
        "Send Her Flowers",
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
      )),
      content: GlassContainer(
          contWidth: width,

          //contHeight: height * 0.51,
          borderRadiusColor: Colors.transparent,
          contColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        GlassContainer(
                            contWidth: width,
                            contHeight: height * 0.12,
                            radius: BorderRadius.circular(0),
                            contColor: Colors.transparent,
                            borderRadiusColor: Colors.transparent,
                            shadowBlurRadius: 15,
                            child: Center(
                                child: Stack(children: [
                              Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "assets/icons/flowermoney.jpg",
                                  width: width,
                                  height: height * 0.12,
                                  fit: BoxFit.cover,
                                ),
                              )),
                            ]))),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Column(
                          children: [
                            Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '  Amount : R${amount}  ',
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        if (amount >= 1000)
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        if (amount >= 10000)
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        if (amount >= 100000)
                                          Icon(Icons.star, color: Colors.yellow)
                                      ],
                                    ))),
                            SizedBox(height: height * 0.01),
                            Container(
                              //width: width * 0.33,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      amount += 100;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R100',
                                            style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                        ]),
                                  )),
                            ),
                            Container(
                              //width: width * 0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 1000;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R1 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  )),
                            ),
                            Container(
                              //width: width * 0.51,
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 10000;
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ' +R10 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  )),
                            ),
                            SizedBox(
                              height: height * 0.0,
                            ),
                            Container(
                              //width: width * 0.7,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      amount += 100000;
                                    });
                                  },
                                  child: Center(
                                      child: SingleChildScrollView(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+R100 000',
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ]),
                                  ))),
                            ),
                            SizedBox(
                              height: height * 0.025,
                            ),
                            GlassContainer(
                              contHeight: height * 0.07,
                              borderRadiusColor: Colors.redAccent,
                              shadowColor: Colors.transparent,
                              shadowBlurRadius: 450,
                              shadowSpreadRadius: 1,
                              contColor: Colors.transparent,
                              radius: BorderRadius.circular(45),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        width: width * 0.85,
                                        child: TextField(
                                            cursorColor: Colors.redAccent,
                                            decoration: const InputDecoration(
                                              hintText:
                                                  "Get yourself something nice.",
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            controller: message,
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300))),
                                  ]),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class BuyThis extends StatefulWidget {
  BuyThis({super.key, required this.name, required this.price, this.cat});
  String? name;
  int? price;
  String? cat;

  @override
  State<BuyThis> createState() => _BuyThisState();
}

class _BuyThisState extends State<BuyThis> {
  bool liked = false;
  bool refresh = false;
  int amount = 0;
  double h = 0;
  double w = 0;
  TextEditingController cont = TextEditingController(text: " Message : ");
  TextEditingController message = TextEditingController(text: " Message : ");

  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController(text: '');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var actions = [
      Container(
        alignment: Alignment.center,
        width: width * 0.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {},
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    "Enjoy",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  Image.asset(
                    "assets/icons/rose.png",
                    height: height * 0.05,
                    width: width * 0.15,
                  )
                ],
              ),
            )),
      ),
      SizedBox(
        width: width * 0.1,
      ),
    ];
    return AlertDialog(
      backgroundColor: Colors.transparent,
      actions: actions,
      insetPadding: EdgeInsets.zero,
      title: Center(
          child: Text(
        "",
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
      )),
      content: GlassContainer(
          contWidth: width,
          radius: BorderRadius.circular(0),
          borderRadiusColor: Colors.transparent,
          contColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.cat == "Drinks"
                          ? "assets/icons/drinks.jpg"
                          : widget.cat == "Food"
                              ? "assets/icons/food.jpg"
                              : widget.cat == "Clothes"
                                  ? "assets/icons/brandcol.jpg"
                                  : widget.cat == "Exp"
                                      ? "assets/icons/Exp.jpg"
                                      : "assets/icons/flowermoney.jpg",
                      width: width,
                      height: height * 0.12,
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: height * 0.1,
                            child: ListView.separated(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                

                                return GlassContainer(
                                  contHeight: height * 0.07,
                                  borderRadiusColor: Colors.redAccent,
                                  shadowColor: Colors.transparent,
                                  shadowBlurRadius: 450,
                                  shadowSpreadRadius: 1,
                                  contColor: Colors.transparent,
                                  radius: BorderRadius.circular(45),
                                  child: 
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                               Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    //width: width * 0.6,
                                                    child: Text(
                                                        "${widget.name}",
                                                        style: GoogleFonts.lato(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300))),
                                              
                                              Container(
                                                  width: width * 0.3,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent)),
                                                  //height:height*0.07,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          //width: width * 0.6,
                                                          child: Text(
                                                              "R${widget.price}",
                                                              style: GoogleFonts.lato(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300)))))
                                            ]),
                                      
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: height * 0.025,
                                );
                              },
                              itemCount: 1,
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          "Disclaimer: You will be sending the money for the item and not the item itself.",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 10),
                        ),
                        SizedBox(
                          height: height * 0.035,
                        ),
                        GlassContainer(
                          contHeight: height * 0.07,
                          borderRadiusColor: Colors.redAccent,
                          shadowColor: Colors.transparent,
                          shadowBlurRadius: 450,
                          shadowSpreadRadius: 1,
                          contColor: Colors.transparent,
                          radius: BorderRadius.circular(45),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 5),
                                    width: width * 0.85,
                                    child: TextField(
                                        cursorColor: Colors.redAccent,
                                        decoration: InputDecoration(
                                          hintText: "Message...",
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.white,fontSize: 20,fontWeight:FontWeight.w300),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                        controller: message,
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300))),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class GiftPopup extends StatefulWidget {
  const GiftPopup({super.key});

  @override
  State<GiftPopup> createState() => _GiftPopupState();
}

class _GiftPopupState extends State<GiftPopup> {
  var amount = 0;
  var names = [
    "Her Favourite Bag",
    "Her Favourite Streaming Service",
    "Her Favourite Perfume",
    "Her Favourite Drink",
    "Her Favourite Artist's Concert Tickets"
  ];
  List prices = [9000, 310, 3000, 350, 10000];

  bool liked = false;
  bool refresh = false;

  double h = 0;
  double w = 0;
  TextEditingController cont = TextEditingController(text: " Message : ");
  TextEditingController message = TextEditingController(text: " Message : ");
  @override
  Widget build(BuildContext context) {
    var amount = prices.reduce((a, b) => a + b);
    TextEditingController message = TextEditingController(text: '');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var actions = [
      
      Container(
        width: width * 0.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {},
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    "Enjoy",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  Image.asset(
                    "assets/icons/rose.png",
                    height: height * 0.05,
                    width: width * 0.15,
                  )
                ],
              ),
            )),
      ),
      SizedBox(
        width: width * 0.1,
      ),
    ];
    return AlertDialog(
      backgroundColor: Colors.transparent,
      actions: actions,
      insetPadding: EdgeInsets.zero,
      title: Center(
          child: Text(
        "Send Her Favourites...",
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
      )),
      content: GlassContainer(
          contWidth: width,
          radius: BorderRadius.circular(0),
          borderRadiusColor: Colors.transparent,
          contColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        GlassContainer(
                            contWidth: width,
                            contHeight: height * 0.125,
                            radius: BorderRadius.circular(1),
                            contColor: Colors.transparent,
                            borderRadiusColor: Colors.transparent,
                            shadowBlurRadius: 15,
                            child: Stack(
                              children: [
                                Image.asset("assets/icons/gift.png",
                                    width: width,
                                    height: height * 0.125,
                                    fit: BoxFit.cover),
                              ],
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  Amount : R${amount}  ',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300),
                            ),
                            if (amount > 1000)
                              Icon(Icons.star, color: Colors.yellow),
                            if (amount > 10000)
                              Icon(Icons.star, color: Colors.yellow)
                          ],
                        )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  swipe to remove item  ',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                        
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Container(
                            height: height * 0.31,
                            child: ListView.separated(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                               

                                return Dismissible(
                                    key: UniqueKey(),
                                    child: GlassContainer(
                                      contHeight: height * 0.07,
                                      borderRadiusColor: Colors.redAccent,
                                      shadowColor: Colors.transparent,
                                      shadowBlurRadius: 450,
                                      shadowSpreadRadius: 1,
                                      contColor: Colors.transparent,
                                      radius: BorderRadius.circular(45),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  //width: width * 0.6,
                                                  child: Text("${names[index]}",style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300))),
                                            ),
                                            Container(
                                                width: width * 0.3,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  border:Border.all(color: Colors.redAccent)
                                                ),
                                                //height:height*0.07,
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  //width: width * 0.6,
                                                  child: Text("R${prices[index]}",style: GoogleFonts.lato(
                                            color: Colors.redAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300)))
                                            )
                                            )
                                            
                                            ]),
                                    ));
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: height * 0.025,
                                );
                              },
                              itemCount: 5,
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        GlassContainer(
                          contHeight: height * 0.07,
                          borderRadiusColor: Colors.redAccent,
                          shadowColor: Colors.transparent,
                          shadowBlurRadius: 450,
                          shadowSpreadRadius: 1,
                          contColor: Colors.transparent,
                          radius: BorderRadius.circular(45),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 5),
                                    width: width * 0.85,
                                    child: TextField(
                                        cursorColor: Colors.redAccent,

                                        decoration: InputDecoration(
                                          hintText: "Message",
                                          hintStyle: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                          enabledBorder: UnderlineInputBorder(
                                            
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                        controller: message,
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300))),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class TrythisPopup extends StatefulWidget {
  const TrythisPopup({super.key});

  @override
  State<TrythisPopup> createState() => _TrythisPopupState();
}

class _TrythisPopupState extends State<TrythisPopup> {
  var amount = 0;

  var names = [
    "Your Favourite Meal",
    "Your Favourite Drink ",
    "Your Favourite Sneakers",
    "Her Favourite Drink",
    "Your Favourite Artist's Concert Tickets"
  ];
  List prices = [350, 500, 1200, 500, 2500];
  bool liked = false;
  bool refresh = false;

  double h = 0;
  double w = 0;
  TextEditingController cont = TextEditingController(text: " Message : ");
  TextEditingController message = TextEditingController(text: " Message : ");
  @override
  Widget build(BuildContext context) {
    var amount = prices.reduce((a, b) => a + b);
    TextEditingController message = TextEditingController(text: 'Message:');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var actions = [
      Container(
        width: width * 0.2,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Nope",
            style: GoogleFonts.lato(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
      ),
      SizedBox(
        width: width * 0.1,
      ),
      Container(
        width: width * 0.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {},
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    "Enjoy",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  Image.asset(
                    "assets/icons/rose.png",
                    height: height * 0.05,
                    width: width * 0.15,
                  )
                ],
              ),
            )),
      ),
      SizedBox(
        width: width * 0.1,
      ),
    ];
    return AlertDialog(
      backgroundColor: Colors.transparent,
      actions: actions,
      insetPadding: EdgeInsets.zero,
      title: Center(
          child: Text(
        "Send Her Your Favourites, You're Letting Her in your World..",
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
      )),
      content: GlassContainer(
          contWidth: width,
          radius: BorderRadius.circular(0),
          borderRadiusColor: Colors.transparent,
          contColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        GlassContainer(
                            contWidth: width,
                            contHeight: height * 0.125,
                            radius: BorderRadius.circular(1),
                            contColor: Colors.transparent,
                            borderRadiusColor: Colors.transparent,
                            shadowBlurRadius: 15,
                            child: Stack(
                              children: [
                                Image.asset("assets/icons/gift.png",
                                    width: width,
                                    height: height * 0.125,
                                    fit: BoxFit.cover),
                              ],
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  Amount : R${amount}  ',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300),
                            ),
                            if (amount > 1000)
                              Icon(Icons.star, color: Colors.yellow),
                            if (amount > 10000)
                              Icon(Icons.star, color: Colors.yellow)
                          ],
                        )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  swipe to remove item  ',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  Tap on text to edit  ',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Container(
                            height: height * 0.31,
                            child: ListView.separated(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                TextEditingController _con =
                                    TextEditingController(
                                        text: "${names[index]}");
                                TextEditingController _con2 =
                                    TextEditingController(
                                        text: "${prices[index]}");

                                return Dismissible(
                                    key: UniqueKey(),
                                    child: GlassContainer(
                                      contHeight: height * 0.07,
                                      borderRadiusColor: Colors.redAccent,
                                      shadowColor: Colors.transparent,
                                      shadowBlurRadius: 450,
                                      shadowSpreadRadius: 1,
                                      contColor: Colors.transparent,
                                      radius: BorderRadius.circular(45),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  //width: width * 0.6,
                                                  child: TextField(
                                                      scrollController:
                                                          ScrollController(),
                                                      cursorColor:
                                                          Colors.redAccent,
                                                      decoration:
                                                          InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                      ),
                                                      controller: _con,
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .w300))),
                                            ),
                                            Container(
                                                width: width * 0.3,
                                                //height:height*0.07,
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller: _con2,
                                                      cursorColor:
                                                          Colors.redAccent,
                                                      decoration:
                                                          InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            width:
                                                                2, //<-- SEE HERE
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            width:
                                                                1, //<-- SEE HERE
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                      ),
                                                      style: GoogleFonts.lato(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.redAccent),
                                                      keyboardType:
                                                          TextInputType.number,
                                                    )))
                                          ]),
                                    ));
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: height * 0.025,
                                );
                              },
                              itemCount: 5,
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        GlassContainer(
                          contHeight: height * 0.07,
                          borderRadiusColor: Colors.redAccent,
                          shadowColor: Colors.transparent,
                          shadowBlurRadius: 450,
                          shadowSpreadRadius: 1,
                          contColor: Colors.transparent,
                          radius: BorderRadius.circular(45),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 5),
                                    width: width * 0.85,
                                    child: TextField(
                                        cursorColor: Colors.redAccent,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                        controller: message,
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300))),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class ConfessionInput extends StatefulWidget {
  const ConfessionInput({super.key});

  @override
  State<ConfessionInput> createState() => _ConfessionInputState();
}

class _ConfessionInputState extends State<ConfessionInput> {
  var togindex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: GlassContainer(
          contHeight: height * 0.25,
          contWidth: width * 0.95,
          radius: BorderRadius.circular(6),
          contColor: Colors.redAccent.withOpacity(0.25),
          borderRadiusColor: Colors.white,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Type your confession here",
                hintStyle: GoogleFonts.lato(color: Colors.white),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: GoogleFonts.lato(color: Colors.white),
          )),
      actions: [
        Center(
          child: ToggleSwitch(
            minWidth: width * 0.7,
            initialLabelIndex: togindex,
            activeBgColor: [Colors.white],
            activeFgColor: Colors.black,
            totalSwitches: 2,
            labels: ["Anonymous", "Public"],
            onToggle: (i) {
              setState(() {
                togindex = i!;
              });
            },
          ),
        ),
        SizedBox(height:height*0.02),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              "Confess",
              style: GoogleFonts.lato(color: Colors.black),
            )),
      ],
    );
  }
}
