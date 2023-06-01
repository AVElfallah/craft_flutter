import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/controller/drawer_widget_controller.dart';
import 'package:hyah_karima/controller/home_page.dart';
import 'package:hyah_karima/data/internal/user_login_data.dart';

import '../router/app_router.dart';

class ProjectDrawerWidget extends StatefulWidget {
  const ProjectDrawerWidget({Key? key}) : super(key: key);

  @override
  State<ProjectDrawerWidget> createState() => _ProjectDrawerWidgetState();
}

class _ProjectDrawerWidgetState extends State<ProjectDrawerWidget> {
  DrawerWidgetController drawerWidgetController = DrawerWidgetController.to;
  HomePageController homePageController = HomePageController.to;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 231, 231, 231),
                ],
              ),
            ),
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.only(
              top: 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 1,
                  ),
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "images/20.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  drawerWidgetController.name.value.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
            onTap: () {
              homePageController.changeIndex(0);
              Navigator.pop(context);
            },
            selectedTileColor: Colors.blue,
          ),
          /*     const Divider(height: 20, thickness: 1),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text(
              "Share",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ), */
          const Divider(height: 20, thickness: 1),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Setting",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              homePageController.changeIndex(3);
              Navigator.pop(context);
            },
          ),
          const Divider(height: 20, thickness: 1),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              "Log out",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              //logout
              UserAuthLoginData.instance.reset();
              Get.offAllNamed(
                MyRouter.introScreen,
              );
            },
          ),
          const Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}
