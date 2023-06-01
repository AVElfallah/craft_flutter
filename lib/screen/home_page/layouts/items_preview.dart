// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hyah_karima/controller/items_preview_controller.dart';

import '../../../widget/search_in_home_widget.dart';
import 'categories_layout.dart';
import 'package:get/get.dart';

import 'products_layout.dart';

class ItemsPreviewPage extends StatelessWidget {
  const ItemsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = ItemsPreviewController.to;

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color(0xffEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              const SearchInHomeWidget(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  " Categories  ".toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              //NOTE - this is the categories layout
              Obx(
                () => CategoriesLayout(
                  catM: ctrl.categories.value,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  " Products  ".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Obx(
                () => ProductsLayout(
                  products: ctrl.products.value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
