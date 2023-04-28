import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/internal/villages_data.dart';
import '../../../widget/map_web_view_widget.dart';
import '../../../widget/village_card_widget.dart';

class VillagesPage extends StatelessWidget {
  const VillagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(10),
        child: VillageCardWidget(
          village: VillagesData.villages[i],
          onPressed: () {
            debugPrint('go');
            Get.to(
              MapWebViewWidget(
                url: VillagesData.villages[i].location,
              ),
            );
          },
        ),
      ),
      itemCount: VillagesData.villages.length,
    );
  }
}
