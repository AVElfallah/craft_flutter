import 'package:flutter/material.dart';

class SizePreviewWidget extends StatefulWidget {
  const SizePreviewWidget(
      {super.key,
      this.size = 30,
      this.text,
      this.onTap,
      required this.isSelected});
  final String? text;
  final double? size;
  final void Function()? onTap;
  final bool isSelected;

  @override
  State<SizePreviewWidget> createState() => _SizePreviewWidgetState();
}

class _SizePreviewWidgetState extends State<SizePreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        height: widget.size,
        width: 2 * widget.size! + 10,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFEdEcF2),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              if (widget.isSelected)
                BoxShadow(
                  color: Colors.green.withOpacity(1),
                  spreadRadius: 4.4,
                  blurRadius: 8,
                ),
              if (!widget.isSelected)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 6,
                  blurRadius: 8,
                ),
            ]),
        child: Text(
          widget.text ?? "00",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 88, 118),
          ),
        ),
      ),
    );
  }
}
