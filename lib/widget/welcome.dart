import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  bool showAnim = true;
  double top1 = 200;
  double top2 = 400;
  double left = 500;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        showAnim = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            width: width,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 101, 116, 122),
              ),
              child: Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(''),
                      WavyAnimatedText('Look at the App'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRouter.homePage,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(microseconds: 500),
            top: top1,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              width: width,
              child: Center(
                child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'popin',
                        color: Color.fromARGB(255, 0, 10, 13)),
                    child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        repeatForever: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Welcome ? we are here for you  ",
                            speed: const Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "all you need in handmade is here",
                            speed: const Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "  ",
                            speed: const Duration(milliseconds: 50),
                          ),
                        ])),
              ),
            ),
          ),
          showAnim
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: top2,
                  width: width,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 101, 116, 122),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 10,
                              height: 100,
                            ),
                            const Text(
                              "Kinds : ",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 15,
                              height: 100,
                            ),
                            DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                                child: AnimatedTextKit(
                                    onFinished: () {
                                      setState(() {
                                        top1 = 200;
                                        top2 = 100;
                                        left = 0;
                                      });
                                    },
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      RotateAnimatedText("Fkhar"),
                                      RotateAnimatedText("Carpet"),
                                      RotateAnimatedText("Wooden"),
                                    ])),
                          ],
                        ),
                      )),
                )
              : Container(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 320,
            left: left,
            child: Container(
              width: width - 40,
              height: 320,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 101, 116, 122),
              ),
              child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 25.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AnimatedTextKit(
                        repeatForever: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Our goal is to help you , get what you want easily ,, as quickly as possible, and with less effort',
                            curve: Curves.easeIn,
                            speed: const Duration(
                              milliseconds: 80,
                            ),
                          ),
                          TypewriterAnimatedText(
                            'get what you want easily',
                            curve: Curves.easeIn,
                            speed: const Duration(
                              milliseconds: 80,
                            ),
                          ),
                          TypewriterAnimatedText(
                            ' as quickly as possible, and with less effort',
                            curve: Curves.easeIn,
                            speed: const Duration(
                              milliseconds: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
