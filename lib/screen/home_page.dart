// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:badges/badges.dart' as badges;
import '../widget/categories_widget.dart';
import '../widget/items_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //drawer: Drawer(),
      //  ),
      appBar: AppBar(
        title: const Text(
          'HYAH KARIMA',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 7, 104, 142),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          badges.Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_basket_outlined,
                size: 32,
                color: Color.fromARGB(255, 12, 88, 118),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.cartPage,
                );
              },
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.list_rounded,
            size: 30,
            color: Color.fromARGB(255, 12, 88, 118),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      body: ListView(
        children: [
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
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          //width: 300,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "search here"),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.camera_alt,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    " ITEMS  ",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                const Categorieswidget(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: const Text(
                    " SALEING ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                const ItemsWidget(),
              ],
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
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
                        ),
                      ),
                    ),
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
                "Home",
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
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 12, 88, 118),

        // child: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        // ignore: prefer_const_constructors
        child: GNav(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 12, 88, 118),
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(255, 12, 88, 118),
          gap: 16,
          onTabChange: (index) {
            debugPrint(index.toString());
          },
          padding: const EdgeInsets.all(18),
          tabs: [
            GButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.profileScreen,
                );
              },
              //iconColor: Color.fromARGB(255, 12, 88, 118),
              icon: Icons.person,
              text: "Home",
            ),
            GButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.likesPage,
                );
              },
              //iconColor: Color.fromARGB(255, 12, 88, 118),
              icon: Icons.favorite_border_outlined,
              text: "About us",
            ),
            GButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.cartPage,
                );
              },
              //iconColor: Color.fromARGB(255, 12, 88, 118),
              icon: Icons.shopping_basket,
              text: "Cart",
            ),
            GButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.settingsPage,
                );
              },
              // iconColor: Color.fromARGB(255, 12, 88, 118),
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        ),
      ),
      //),
    );
  }
}
