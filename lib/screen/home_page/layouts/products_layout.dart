import 'package:flutter/material.dart';
import 'package:hyah_karima/widget/custom_product_card_widget.dart';

import '../../../model/product/product.dart';

class ProductsLayout extends StatelessWidget {
  const ProductsLayout({super.key, this.products});
  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.53,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < products!.length; i++)
          CustomProductCardWidget(
            product: products![i],
          )
      ],
    );
  }
}
