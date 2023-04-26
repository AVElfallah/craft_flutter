import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:hyah_karima/router/forMap.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.6,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 2; i++)
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 219, 219).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 88, 118),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Alexandria",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    " ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        " ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 88, 118),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        // for (int i = 1; i < 3; i++)
        ElevatedButton.icon(
          onPressed: (() {
            // MapUtils.openMap(-3.823216, -38.481700);
          }),
          icon: const Icon(CupertinoIcons.cart_badge_plus),
          label: const Text(
            "ALEXANDRIA",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 11, 72, 96)),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 219, 219).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 88, 118),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  // MapUtils.openMap(-3.823216, -38.481700);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Mansoura ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  " ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 12, 88, 118),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: (() async {
            // MapUtils.openMap(-3.823216, -38.481700);
            final String googleMapsUrl =
                'https://www.google.com/maps/search/?api=1&query=30.958592,31.2371792';
            if (await canLaunch(googleMapsUrl)) {
              await launch(googleMapsUrl);
            } else {
              throw 'Could not open Google Maps';
            }
          }),
          icon: const Icon(CupertinoIcons.cart_badge_plus),
          label: const Text(
            "MANSOURA",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 11, 72, 96)),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        //  for (int i = 4; i < 8; i++)
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 219, 219).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 88, 118),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "faharitem");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  " Cairo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "   ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 12, 88, 118),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: (() {
            Navigator.of(context).pushNamed(
              MyRouter.orderPage,
            );
          }),
          icon: const Icon(CupertinoIcons.cart_badge_plus),
          label: const Text(
            "Add To Cart",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 11, 72, 96)),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
      ],
    );
  }
}
