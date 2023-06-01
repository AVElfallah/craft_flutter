import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:hyah_karima/controller/home_page.dart';
import 'package:hyah_karima/controller/items_preview_controller.dart';
import 'package:hyah_karima/controller/product_card_controller.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/product/product.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:provider/provider.dart';

class CustomProductCardWidget extends StatelessWidget {
  final Product? product;

  const CustomProductCardWidget({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    int discount = ((product!.originalPrice! - product!.sellingPrice!)).round();
    return ChangeNotifierProvider<ProductCardController>(
      create: (context) => ProductCardController(
        product!.id.toString(),
      ),
      builder: (context, _) {
        var watch = context.watch<ProductCardController>();
        var read = context.read<ProductCardController>();
        return Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(
              255,
              230,
              219,
              219,
            ).withOpacity(0.5),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 88, 118),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${discount.toInt()}% OFF',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      read.favAction();
                    },
                    icon: Icon(
                      watch.isFav ? Icons.favorite : Icons.favorite_border,
                      color: watch.isFav
                          ? Colors.red
                          : const Color.fromARGB(
                              255,
                              12,
                              88,
                              118,
                            ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MyRouter.itemPage,
                    arguments: {
                      'product': product,
                    },
                  ).then(
                    (value) {
                      HomePageController.to.refreshCartCount();
                      ItemsPreviewController.get.refresh();
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: getImageUrl(product!.image!),
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      );
                    },
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'images/leath.png',
                      fit: BoxFit.cover,
                    ),
                    height: 115,
                    width: 120,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  product!.title!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product!.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "L.E : ${product!.originalPrice}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color.fromARGB(255, 0, 0, 0),
                        decorationThickness: 2,
                        color: Color.fromARGB(255, 12, 88, 118),
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_checkout,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "L.E : ${product!.sellingPrice}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
