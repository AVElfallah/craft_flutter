import 'package:flutter/material.dart';

class PincodePasswordFiledWidget extends StatefulWidget {
  const PincodePasswordFiledWidget({
    super.key,
    required this.controller,
    this.validator,
    this.label,
  });
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;

  @override
  State<PincodePasswordFiledWidget> createState() =>
      _PincodePasswordFiledWidgetState();
}

class _PincodePasswordFiledWidgetState
    extends State<PincodePasswordFiledWidget> {
  bool isHiden = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: widget.controller ?? TextEditingController(),
        validator: widget.validator,
        obscureText: isHiden,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: () {
              setState(() {
                isHiden = !isHiden;
              });
            },
            icon: Icon(
              isHiden
                  ? Icons.remove_red_eye_rounded
                  : Icons.visibility_off_rounded,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal.shade900,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelText: widget.label ?? 'Password',
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
