import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hyah_karima/controller/item_page_controller.dart';
import 'package:hyah_karima/widget/reusable_text_field.dart';

import '../extensions/colors.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key, this.rate, this.controller});
  final int? rate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Rating".toUpperCase(),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          children: [
            Text(
              "You have rated $rate stars",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ReusableTextField(
                hintText: "Write your comment here",
                controller: controller!,
                isNote: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.find<ItemPageController>(tag: 'itemPageController')
                    .createReivew(
                  controller!.text,
                  rate!,
                );
              },
              icon: const Icon(Icons.save),
              label: const Text(
                "Save Comment",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
