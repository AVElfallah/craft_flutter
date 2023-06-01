import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/controller/cart_page_controller.dart';
import 'package:hyah_karima/widget/cart/cart_item_widget.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key, this.products});
  final List? products;

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CartPageController>(tag: 'CartPageController');
    return Column(
      children: [
        for (int i = 0;
            i < ((widget.products == null) ? 0 : widget.products!.length);
            i++)
          CartItemWidget(
            title: widget.products![i].title,
            image: widget.products![i].image,
            price: widget.products![i].price,
            quantity: widget.products![i].quantity,
            onDelete: () {
              ctrl.deleteSingleItemFromCart(widget.products![i].id);
            },
          )
      ],
    );
  }
}
