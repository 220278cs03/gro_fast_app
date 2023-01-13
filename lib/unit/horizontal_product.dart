import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../style/style.dart';
import 'image_network.dart';

class HorizontalProduct extends StatelessWidget {
  final ProductModel? product;

  const HorizontalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23), color: Style.useColorGrey),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 17),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomImageNetwork(
              image: product?.image,
            ),
          ),
          Container(
            width: 150,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    product?.title ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Style.darkGreen),
                  ),
                ),
                // RichText(
                //   text: TextSpan(
                //   children: [
                //     TextSpan(text: (product?.price ?? 0).toString().substring(0,product?.price ?? 0).toString().indexOf('.')), style: TextStyle(color: Style.darkGreen)),
                //     TextSpan(text: (product?.price ?? 0).toString().substring(product?.price ?? 0).toString().indexOf('.'), product?.price ?? 0).toString().length - 1), style: TextStyle(color: Style.darkGreen)),
                //
                // ])),
                Text("\$ ${(product?.price ?? 0).toString()}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Style.primaryColor),),
              ])),
        ],
      ),
    );
  }
}
