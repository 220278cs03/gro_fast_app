import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../repository/get_info.dart';
import '../style/style.dart';
import '../unit/horizontal_product.dart';
import '../unit/vertical_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel?>? lifOfProduct = [];
  List listOfCategory = [];
  bool isLoading = true;
  bool isHorizontal = true;
  int? currentCategory;
  bool isLoadingProduct = false;

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  getInformation() async {
    isLoading = true;
    setState(() {});
    lifOfProduct = await GetInfo.getProduct();
    listOfCategory = await GetInfo.getCategory();
    isLoading = false;
    setState(() {});
  }

  getProductByCategory([String? title]) async {
    isLoadingProduct = true;
    setState(() {});
    lifOfProduct = title != null
        ? await GetInfo.getProductByCategory(title)
        : await GetInfo.getProduct();
    isLoadingProduct = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Style.greyColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(Icons.arrow_back, color: Style.greyColor),
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
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 270,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(18)),
                                filled: true,
                                fillColor: Style.useColorGrey,
                                hintText: 'Search products',
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Style.darkGreen.withOpacity(0.4)),
                                prefixIcon: Image.asset('search.png')),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Style.useColorGrey,
                              borderRadius: BorderRadius.circular(18)),
                          child: Image.asset('filter.png'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 67,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listOfCategory.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Style.useColorGrey,
                                        border: Border.all(
                                            color: currentCategory == index
                                                ? Style.borderCategory
                                                : Style.transparentColor)),
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                        child: Text(
                                      listOfCategory[index] ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Style.darkGreen),
                                    ))),
                                onTap: () {
                                  if (currentCategory == index) {
                                    currentCategory = null;
                                    getProductByCategory();
                                  } else {
                                    getProductByCategory(listOfCategory[index]);
                                    currentCategory = index;
                                  }
                                });
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentCategory != null
                              ? "All Product : ${listOfCategory[currentCategory!]}"
                              : "All Product",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Style.darkGreen),
                        ),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(isHorizontal
                                ? 'menu_listview.png'
                                : 'menu_gridview.png'),
                          ),
                          onTap: () {
                            isHorizontal = !isHorizontal;
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    isLoadingProduct
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 220,
                            ),
                            child: CircularProgressIndicator(),
                          )
                        : isHorizontal
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: lifOfProduct?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      HorizontalProduct(
                                          product: lifOfProduct?[index]),
                                      Positioned(
                                        right: 24,
                                        top: 24,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Style.white),
                                          child: Center(
                                              child: Icon(
                                            Icons.favorite,
                                            color: Style.redColor,
                                            size: 10,
                                          )),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 17,
                                        child: Container(
                                          height: 41,
                                          width: 53,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(23),
                                                  topLeft: Radius.circular(15)),
                                              gradient: LinearGradient(colors: [
                                                Color(0xff26AD71),
                                                Color(0xff32CB4B)
                                              ])),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Style.white,
                                            size: 20,
                                          )),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: lifOfProduct?.length ?? 0,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 17),
                                itemBuilder: (context, index) => Stack(
                                      children: [
                                        VerticalProduct(
                                            product: lifOfProduct?[index]),
                                        Positioned(
                                          right: 17,
                                          top: 17,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Style.white),
                                            child: Center(
                                                child: Icon(
                                              Icons.favorite,
                                              color: Style.redColor,
                                              size: 10,
                                            )),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 17,
                                          child: Container(
                                            height: 41,
                                            width: 53,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(23),
                                                    topLeft:
                                                        Radius.circular(15)),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff26AD71),
                                                      Color(0xff32CB4B)
                                                    ])),
                                            child: Center(
                                                child: Icon(
                                              Icons.add,
                                              color: Style.white,
                                              size: 20,
                                            )),
                                          ),
                                        )
                                      ],
                                    )),
                  ],
                ),
              ),
            ),
    );
  }
}
