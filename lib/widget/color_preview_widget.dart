import 'package:flutter/material.dart';

class ColorPreviewWidget extends StatefulWidget {
  final Color color;
  final double size;
  final void Function()? onTap;
  final bool isSelected;

  const ColorPreviewWidget({
    Key? key,
    required this.color,
    this.size = 30,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<ColorPreviewWidget> createState() => _ColorPreviewWidgetState();
}

class _ColorPreviewWidgetState extends State<ColorPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        height: widget.size,
        width: widget.size,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: widget.color,
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
          ],
        ),
      ),
    );
  }
}
