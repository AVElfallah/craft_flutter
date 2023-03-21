import 'package:flutter/material.dart';

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
        // for (int i = 1; i < 2; i++)
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
                  //  Navigator.pushNamed(context, "itempage");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "the goal of our project",
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
        // for (int i = 1; i < 3; i++)

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
                  // Navigator.pushNamed(context, "itempage");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "why we choice Hand Craft",
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
                  //Navigator.pushNamed(context, "faharitem");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  " THE PROJECT BUILD IN M.ET :       ",
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
                  //Navigator.pushNamed(context, "faharitem");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  " by DR :       ",
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
                  " AND  TEAM:  ",
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
      ],
    );
  }
}
