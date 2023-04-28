import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hyah_karima/controller/drawer_widget_controller.dart';
import 'package:hyah_karima/controller/home_page.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hyah_karima/screen/home_page/layouts/settings_page.dart';

import '../../widget/project_drawer.dart';
import 'layouts/items_preview.dart';
import 'layouts/villages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    DrawerWidgetController.put;
    var ctrl = HomePageController.put;

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

      body: PageView(
        controller: ctrl.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ItemsPreviewPage(),
          VillagesPage(),
          SettingsPage(),
        ],
      ),

      drawer: const ProjectDrawerWidget(),
      bottomNavigationBar: Obx(() {
        return GNav(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(
            255,
            12,
            88,
            118,
          ),
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(
            255,
            12,
            88,
            118,
          ),
          gap: 15,
          onTabChange: ctrl.changeIndex,
          selectedIndex: ctrl.currentIndex.value,
          tabMargin: const EdgeInsets.all(
            10,
          ),
          padding: const EdgeInsets.all(
            11,
          ),
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
              icon: Icons.holiday_village,
              text: "Places",
            ),
            GButton(
              onPressed: () {
                //TODO - add navigation to settings page
              },
              // iconColor: Color.fromARGB(255, 12, 88, 118),
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        );
      }),
      //),
    );
  }
}
