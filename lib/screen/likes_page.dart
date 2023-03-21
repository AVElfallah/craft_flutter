// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:hyah_karima/widget/about_widget.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  //const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //drawer: Drawer(),
      //  ),

      body: ListView(
        children: [
          //  const HomeAppBar(),
          Container(
            //height: 500,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xffEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 10,
                  ),
                  // ignore: prefer_const_constructors
                ),
                //  Categorieswidget(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    " Herftna in Egypt ",

                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                const AboutWidget(),
              ],
            ),
          ),
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 1),
                    height: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                          "images/20.png",
                        ))),
                  ),
                  const Text(
                    "mariam wahba",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "programming engineer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text(
                "home",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              selectedTileColor: Colors.blue,
              // tileColor: Color.fromARGB(255, 160, 203, 238),
            ),
            const Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text(
                "Share",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            const Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                "Setting",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.settingsPage,
                );
              },
            ),
            const Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text(
                "Privacy and secuirty",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.pinScreen,
                );
              },
            ),
            const Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text(
                "Log out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.introScreen,
                );
              },
            ),
            const Divider(height: 20, thickness: 1),
          ],
        ),
      ),
    );
  }
}
