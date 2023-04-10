import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:badges/badges.dart' as badges;
import '../widget/categories_widget.dart';
import '../widget/items_widget.dart';
import '../widget/project_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
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
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
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

      drawer: const ProjectDrawerWidget(),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 12, 88, 118),
        activeColor: Colors.white,
        tabBackgroundColor: const Color.fromARGB(255, 12, 88, 118),
        gap: 15,
        onTabChange: (index) {
          debugPrint(index.toString());
        },
        tabMargin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(11),
        tabs: [
          GButton(
            onPressed: () {
              //TODO - add navigation to home page
              /*  Navigator.pushNamed(
                context,
                MyRouter.profileScreen,
              ); */
            },
            //iconColor: Color.fromARGB(255, 12, 88, 118),
            icon: Icons.person,
            text: "Home",
          ),
          GButton(
            onPressed: () {
              //TODO - add navigation to likes page
              /* Navigator.pushNamed(
                context,
                MyRouter.likesPage,
              ); */
            },
            //iconColor: Color.fromARGB(255, 12, 88, 118),
            icon: Icons.favorite_border_outlined,
            text: "About us",
          ),
          GButton(
            onPressed: () {
              //TODO - add navigation to cart page
              /* Navigator.pushNamed(
                context,
                MyRouter.cartPage,
              ); */
            },
            //iconColor: Color.fromARGB(255, 12, 88, 118),
            icon: Icons.shopping_basket,
            text: "Cart",
          ),
          GButton(
            onPressed: () {
              //TODO - add navigation to settings page
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
      //),
    );
  }
}
