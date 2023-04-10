import 'package:flutter/material.dart';

class PincodeTextWidget extends StatefulWidget {
  const PincodeTextWidget(
      {Key? key,
      this.focusNode,
      this.controller,
      this.validator,
      this.isTopLevel = false})
      : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isTopLevel;

  @override
  State<PincodeTextWidget> createState() => _PincodeTextWidgetState();
}

class _PincodeTextWidgetState extends State<PincodeTextWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller ?? TextEditingController();

    return SizedBox(
      height: 60,
      width: 65,
      child: TextFormField(
        controller: controller,
        focusNode: widget.focusNode ?? FocusNode(),
        validator: widget.validator,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (val) {
          if (val.length == 1) {
            // focusNode.unfocus();

            FocusScope.of(context).nextFocus();
          }
          if (val.isEmpty) {
            if (!widget.isTopLevel) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: '*',
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
