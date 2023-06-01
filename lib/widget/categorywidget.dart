import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hyah_karima/controller/items_preview_controller.dart';
import 'package:hyah_karima/extensions/constant.dart';

import '../model/product/categories.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, this.category, this.onTap});
  final CategoryModel? category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var ctrl = ItemsPreviewController.get;
    return InkWell(
      onTap: onTap ??
          () {
            ctrl.filterByCategory(category?.id ?? 0);
          },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: !ctrl.expectedCategories.contains(category?.id)
                ? const Color.fromARGB(255, 230, 219, 219).withOpacity(0.5)
                : Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: getImageUrl(category!.images[0].path),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    );
                  },
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'images/leath.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                category!.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                    255,
                    12,
                    88,
                    118,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
