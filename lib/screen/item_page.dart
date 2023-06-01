import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/extensions/assestent_extension.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/product/product.dart';
import 'package:hyah_karima/widget/color_preview_widget.dart';
import 'package:hyah_karima/widget/item_bottom_navbar.dart';
import '../controller/item_page_controller.dart';
import '../extensions/colors.dart';
import '../widget/item_appbar.dart';
import '../widget/rating_dialog.dart';
import '../widget/size_preview_widget.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    Product product = args["product"];

    var ctrl = Get.put<ItemPageController>(
      ItemPageController(
        product.colors!.length,
        product.sizes!.length,
        product,
      ),
      tag: 'itemPageController',
    );

    return GetX<ItemPageController>(
      tag: 'itemPageController',
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: const Color(0xFFEdEcF2),
          body: !ctrl.isLoading.value
              ? ListView(
                  children: [
                    const ItemAppBar(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CachedNetworkImage(
                        imageUrl: getImageUrl(product.image!),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        fit: BoxFit.contain,
                        errorWidget: (context, error, stackTrace) =>
                            Image.asset(
                          'images/leath.png',
                          fit: BoxFit.contain,
                        ),
                        height: 180,
                      ),
                    ),
                    Arc(
                      edge: Edge.TOP,
                      arcType: ArcType.CONVEY,
                      height: 30,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  bottom: 20,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      product.title!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 12, 88, 118),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 4,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      onRatingUpdate: (index) {
                                        Get.dialog(
                                          RatingDialog(
                                            rate: index.toInt(),
                                            controller: TextEditingController(),
                                          ),
                                        );
                                      },
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => ctrl.decQuantity(),
                                          icon: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.minus,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          iconSize: 32,
                                          color: Colors.blue,
                                          splashColor: Colors.grey,
                                        ),
                                        Obx(
                                          () => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              ctrl.selectedQuantity.value
                                                  .toString()
                                                  .padLeft(
                                                    2,
                                                    "0",
                                                  ),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => ctrl.incQuantity(),
                                          icon: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.plus,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          iconSize: 32,
                                          color: Colors.blue,
                                          splashColor: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  product.description!,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 12, 88, 118),
                                  ),
                                ),
                              ),
                              const Divider(height: 20, thickness: 1),
                              SizedBox(
                                width: context.width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      const Text(
                                        " Size:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 12, 88, 118),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      for (int i = 0;
                                          i < product.sizes!.length;
                                          i++)
                                        Obx(
                                          () => SizePreviewWidget(
                                            text: product.sizes![i].size,
                                            isSelected:
                                                ctrl.selectedSizes.value[i],
                                            onTap: () {
                                              ctrl.toggleSize(i);
                                            },
                                          ),
                                        ),
                                      const Divider(height: 20, thickness: 1),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Color:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 12, 88, 118),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 10,
                                      ),

                                      Row(
                                        children: [
                                          for (int i = 0;
                                              i < product.colors!.length;
                                              i++)
                                            Obx(
                                              () => ColorPreviewWidget(
                                                color: product.colors![i].color!
                                                    .getColorFromHex(),
                                                isSelected: ctrl
                                                    .selectedColors.value[i],
                                                onTap: () {
                                                  return ctrl.toggleColor(i);
                                                },
                                              ),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(height: 20, thickness: 1),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'RATING ${product.rate?.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade800,
                                    )
                                  ],
                                ),
                              ),
                              const Divider(height: 20, thickness: 1),
                              ExpansionTile(
                                title: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'REVIEWS ${ctrl.reviews.length} ',
                                        style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.group,
                                      color: primaryColor,
                                    )
                                  ],
                                ),
                                children: [
                                  for (int i = 0; i < ctrl.reviews.length; i++)
                                    ListTile(
                                      title: Text(
                                        ctrl.reviews[i].name!.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.person,
                                      ),
                                      trailing: SizedBox(
                                        width: 60,
                                        child: Row(
                                          children: [
                                            Text(
                                              ctrl.reviews[i].rate.toString(),
                                              style: const TextStyle(
                                                color: primaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Text(
                                        ctrl.reviews[i].review!,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          bottomNavigationBar: ItemBottomNavBar(
            price: (product.sellingPrice! * ctrl.selectedQuantity.value)
                .toString(),
            onTap: () => ctrl.addToCart(
              product,
            ),
          ),
        );
      },
    );
  }
}
