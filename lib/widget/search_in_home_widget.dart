import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/controller/home_page.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

import '../controller/items_preview_controller.dart';
import '../model/product/product.dart';
import '../router/app_router.dart';

class SearchInHomeWidget extends StatelessWidget {
  const SearchInHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<ItemsPreviewController>(tag: 'ItemsPreviewController');
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: PaginatedSearchBar<Product>(
        onSearch: ({
          required pageIndex,
          required pageSize,
          required searchQuery,
        }) async {
          //SECTION - Filter search results
          var lis = ctrl.products
              .where(
                (it) =>
                    it.title!.contains(
                      searchQuery,
                    ) ||
                    it.description!.contains(
                      searchQuery,
                    ),
              )
              .toList();
          return lis;
        },
        itemBuilder: (
          context, {
          required item,
          required index,
        }) {
          return ListTile(
            title: Text(
              item.title!,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.itemPage,
                arguments: {
                  'product': item,
                },
              ).then(
                (value) {
                  if (value != null) {
                    HomePageController.to.refreshCartCount();
                  }
                },
              );
            },
            leading: SizedBox(
              width: 50,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: getImageUrl(
                  item.image!,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            subtitle: Text(
              item.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          );
        },
        containerDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        inputDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          hintText: "search here",
          suffixIcon: const Icon(Icons.search),
          constraints: BoxConstraints.loose(
            const Size.fromHeight(
              50,
            ),
          ),
        ),
      ),
    );
  }
}
