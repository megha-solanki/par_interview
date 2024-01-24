import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Products products;

  const ProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 5,
                child: Image.network(
                  products.images![0],
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${products.title}",
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16, height: 0, color: Colors.white),
                  ),
                  Text("₹${products.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
