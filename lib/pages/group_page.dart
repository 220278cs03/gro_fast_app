import 'package:flutter/material.dart';

import '../model/persons_model.dart';
import '../repository/get_info.dart';
import '../style/style.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {

  bool isLoading = true;
  List<PersonModel?>? list = [];

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  getInfo() async {
    isLoading = true;
    setState(() {});
    list = await GetInfo.getPersons();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People", style: TextStyle(color: Style.darkGreen),),
        centerTitle: true,
        backgroundColor: Style.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16 ),
        itemCount: list?.length ?? 0,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Style.useColorGrey,
                  borderRadius: BorderRadius.circular(32)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(list?[index]?.username ?? "", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Style.darkGreen.withOpacity(0.4))),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(list?[index]?.name?.firstname ?? "", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Style.darkGreen.withOpacity(0.4))),
                  ),
                  Text(list?[index]?.name?.lastname ?? "", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Style.darkGreen.withOpacity(0.4))),
                ],
              ),
            );
          }),
    );
  }
}
