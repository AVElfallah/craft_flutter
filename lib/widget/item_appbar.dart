import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/item_page_controller.dart';
import '../controller/items_preview_controller.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<ItemPageController>(tag: 'itemPageController');
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 12, 88, 118),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 88, 118),
              ),
            ),
          ),
          const Spacer(),
          Obx(
            () => IconButton(
              onPressed: () {
                ctrl.addToFav();
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: ctrl.isFav.value ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
