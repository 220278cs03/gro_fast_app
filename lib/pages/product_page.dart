import 'package:flutter/material.dart';
import 'package:grow_fast_app/pages/home_page.dart';
import 'package:grow_fast_app/pages/product_list_page.dart';
import 'package:grow_fast_app/unit/image_network.dart';
import 'package:readmore/readmore.dart';

import '../model/product_model.dart';
import '../style/style.dart';

class ProductPage extends StatefulWidget {
  final ProductModel? product;
  ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              height: 466,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Style.useColorGrey,
                borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(300,60), bottomLeft: Radius.elliptical(300,60))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Style.greyColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(Icons.arrow_back, color: Style.greyColor),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomePage()));
                        },
                      ),
                      Stack(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Style.greyColor,
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Style.redColor),
                              ))
                        ],
                      )
                    ],
                  ),
                  CustomImageNetwork(image: widget.product?.image, height: 200, width: 200,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox.shrink(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.white),
                        child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Style.redColor,
                              size: 20,
                            )),
                      ),
                    ],
                  )

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('freeshipping.png'),
                  SizedBox(height: 24,),
                  Text(widget.product?.title ?? "",style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Style.darkGreen)),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 74,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Style.greyColor.withOpacity(0.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star, color: Style.yellowColor,size: 14,),
                              Text((widget.product?.rating?.rate ?? 0).toString(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Style.greyColor),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Style.useColorGrey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text((widget.product?.category ?? ""), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Style.greyColor),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 32,),
                  Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Style.darkGreen),),
                  SizedBox(height: 24,),
                  ReadMoreText(
                    widget.product?.description ?? "",
                    trimLines: 2,
                    colorClickableText: Colors.blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Hide',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Style.greyColor),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Style.useColorGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text("-", style: TextStyle(color: Style.primaryColor, fontWeight: FontWeight.w700, fontSize: 36),)),
                  ),
                  onTap: (){
                    if(count != 0 )
                      count = count - 1;
                    setState(() {});
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("$count", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Style.greyColor),),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Style.useColorGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text("+", style: TextStyle(color: Style.primaryColor, fontWeight: FontWeight.w700, fontSize: 36),)),
                  ),
                  onTap: (){
                    count = count + 1;
                    setState(() {});
                  },
                ),
                Spacer(),
                Container(
                  height: 82,
                  width: 196,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:
                          Radius.circular(28)),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff26AD71),
                            Color(0xff32CB4B)
                          ])),
                  child: Center(
                      child: Text(
                        "Add to bag", style: TextStyle(color: Style.white, fontWeight: FontWeight.w600, fontSize: 18),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
