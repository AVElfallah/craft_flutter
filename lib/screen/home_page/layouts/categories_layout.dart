import 'package:flutter/material.dart';
import 'package:hyah_karima/widget/categorywidget.dart';

import '../../../model/product/categories.dart';

class CategoriesLayout extends StatelessWidget {
  const CategoriesLayout({super.key, this.catM});
  final List<CategoryModel>? catM;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < catM!.length; i++)
            CategoryWidget(
              category: catM![i],
            )
        ],
      ),
    );
  }
}
