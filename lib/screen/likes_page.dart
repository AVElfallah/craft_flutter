import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/router/app_router.dart';

import '../controller/fav_page_controller.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put<FavPageController>(FavPageController(),
        tag: 'favPageController');
    return Obx(
      () => Scaffold(
        body: ListView.builder(
          itemBuilder: (_, i) => ListTile(
            title: Text(
              ctrl.favProducts[i].title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${ctrl.favProducts[i].sellingPrice} L.E',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.itemPage,
                arguments: {"product": ctrl.favProducts[i]},
              );
            },
            isThreeLine: true,
            leading: SizedBox(
              width: 100,
              child: CachedNetworkImage(
                imageUrl: getImageUrl(ctrl.favProducts[i].image!),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                ctrl.deleteProductFav(ctrl.favProducts[i].id.toString());
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ),
          itemCount: ctrl.favProducts.length,
        ),
      ),
    );
  }
}
