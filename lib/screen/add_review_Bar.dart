import 'package:flutter/material.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                "Add review",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 88, 118),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
