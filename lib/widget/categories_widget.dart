import 'package:flutter/material.dart';

class Categorieswidget extends StatelessWidget {
  const Categorieswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 10; i < 14; i++)
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 219, 219).withOpacity(
                  0.5,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/$i.png",
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    "",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(
                        255,
                        12,
                        88,
                        118,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          for (int i = 4; i < 8; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 230, 219, 219).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/$i.png",
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    "",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
