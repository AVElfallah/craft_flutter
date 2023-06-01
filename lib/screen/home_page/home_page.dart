import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hyah_karima/controller/drawer_widget_controller.dart';
import 'package:hyah_karima/controller/fav_page_controller.dart';
import 'package:hyah_karima/controller/home_page.dart';
import 'package:hyah_karima/data/external/cart_database.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hyah_karima/screen/home_page/layouts/settings_page.dart';
import 'package:hyah_karima/screen/likes_page.dart';

import '../../extensions/colors.dart';
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
    CartDatabase().fetchCartItems();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'HYAH KARIMA',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Obx(
            () => badges.Badge(
              showBadge: ctrl.cartCount.value != 0,
              badgeContent: Text(
                ctrl.cartCount.value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_basket_outlined,
                  size: 32,
                  color: primaryColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MyRouter.cartPage,
                  ).then(
                    (value) {
                      HomePageController.to.refreshCartCount();
                    },
                  );
                },
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.list_rounded,
            size: 30,
            color: primaryColor,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: PageView(
        controller: ctrl.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ItemsPreviewPage(),
          FavPage(),
          VillagesPage(),
          SettingsPage(),
        ],
      ),
      drawer: const ProjectDrawerWidget(),
      bottomNavigationBar: Obx(
        () {
          return GNav(
            backgroundColor: Colors.white,
            color: primaryColor,
            activeColor: Colors.white,
            tabBackgroundColor: primaryColor,
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
                },
                //iconColor: Color.fromARGB(255, 12, 88, 118),
                icon: Icons.person,
                text: "Home",
              ),
              GButton(
                onPressed: () {},
                //iconColor: Color.fromARGB(255, 12, 88, 118),
                icon: Icons.favorite_border,
                text: "Favorites",
              ),
              GButton(
                onPressed: () {
                  //TODO - add navigation to likes page
                },
                //iconColor: Color.fromARGB(255, 12, 88, 118),
                icon: Icons.holiday_village,
                text: "Places",
              ),
              GButton(
                onPressed: () {
                  //TODO - add navigation to settings page
                },
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          );
        },
      ),
    );
  }
}
