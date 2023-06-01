import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isNote;

  const ReusableTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
    this.isNote = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xffEDECF2),
        borderRadius: BorderRadius.circular(isNote ? 15 : 30),
      ),
      width: 370,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 20,
            color: isNote ? Colors.grey : null,
          ),
          hintText: hintText,
        ),
        validator: validator,
        maxLines: isNote ? 4 : 1,
      ),
    );
  }
}
