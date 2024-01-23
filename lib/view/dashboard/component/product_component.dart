import 'package:flutter/material.dart';
import 'package:par_interview/constant/color_const.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all( 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: lightBlack,
      ),
      child: Row(
        children: [
          Text("data")
        ],
      ),
    );
  }
}
