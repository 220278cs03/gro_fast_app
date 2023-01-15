import 'package:flutter/material.dart';
import 'package:grow_fast_app/model/product_model.dart';

import '../repository/get_info.dart';
import '../store/store.dart';
import '../style/style.dart';
import '../unit/horizontal_product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Set<String> myset = {};
  bool isLoading = true;
  List<ProductModel?>? lifOfProduct = [];

  Future<Set<String>> getInfo() async {
    List<String> list = [];
    isLoading = true;
    setState(() {});
    list = await LocalStore.getId();
    list.sort();
    list.forEach((element) {
      myset.add(element);
    });

    myset.forEach((element) {
      print(element);
    });
    isLoading = false;
    setState(() {});

    return myset;
  }

  getInformation() async {
    isLoading = true;
    setState(() {});
    lifOfProduct = await GetInfo.getProduct();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    getInformation();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading ? CircularProgressIndicator() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 41),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Style.greyColor.withOpacity(0.2)),
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
                              shape: BoxShape.circle, color: Style.redColor),
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
            Text("${myset.toList().length}"),
            SizedBox(
              height: 15,
            ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    //itemCount: myset.toList().length,
                      itemBuilder: (context, index){
                       if (myset.toList().contains(lifOfProduct?[index]?.id))
                         return HorizontalProduct(product: lifOfProduct?[index],) ;
                       else
                         return SizedBox.shrink();
                  }),
                )
          ]),
        ),
      ),
    );
  }
}
