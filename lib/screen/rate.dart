import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  @override
  _Rate createState() => _Rate();
}

class _Rate extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 10,
              blurRadius: 3,
            )
          ]),
        ),
      ],
    ));
  }
}
