import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../model/product_model.dart';
import '../style/style.dart';
import 'image_network.dart';

class VerticalProduct extends StatelessWidget {
  final ProductModel? product;

  const VerticalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23), color: Style.useColorGrey),
      padding: const EdgeInsets.all(17),
      margin: const EdgeInsets.only(bottom: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomImageNetwork(
              image: product?.image,
              height: 50,
              width: 50,
            ),
          ),
          ReadMoreText(
            product?.title ?? "",
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Style.darkGreen),
          ),
          Text("\$ ${(product?.price ?? 0).toString()}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Style.primaryColor),),

        ],
      ),
    );
  }
}
