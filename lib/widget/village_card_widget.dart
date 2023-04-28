import 'package:flutter/material.dart';

import '../model/village_model.dart';

class VillageCardWidget extends StatelessWidget {
  const VillageCardWidget({super.key, this.village, this.onPressed});
  final VillageModel? village;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * .55,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800.withOpacity(.8),
        image: DecorationImage(
          image: AssetImage(village!.imageAsset ?? 'images/1.png'),
          fit: BoxFit.fill,
          opacity: .6,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.075,
              backgroundColor: Colors.white,
              backgroundImage:
                  AssetImage(village!.imageAsset ?? 'images/1.png'),
            ),
            const Spacer(),
            Text(
              village?.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
            Text(
              village!.arName ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              village!.discrption ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              village!.arDiscrption ?? '',
              textAlign: TextAlign.justify,
              locale: const Locale('ar'),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: onPressed,
              label: const Text(
                'Map /الخريطة',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                ),
              ),
              icon: const Icon(
                Icons.location_on,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
