import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';

class ProjectDrawerWidget extends StatelessWidget {
  const ProjectDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
