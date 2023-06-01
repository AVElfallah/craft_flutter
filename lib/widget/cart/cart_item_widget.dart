import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/extensions/constant.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String image;
  final int price;
  final int quantity;
  final VoidCallback onDelete;

  const CartItemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selectedColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          isThreeLine: true,
          subtitle: Text(
            'Price: $price L.E \nQuantity: $quantity',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          leading: Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: getImageUrl(image),
              width: 80,
              height: 80,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
