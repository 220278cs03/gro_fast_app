import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class LocalStore{

LocalStore._();

static Future<List<String>> getId() async{
  SharedPreferences store = await SharedPreferences.getInstance();
  List<String> list = [];
  list = store.getStringList('id') ?? [];
  return list;

}

static setId(int id) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  List<String> list = store.getStringList("id") ?? [];
  list.add(id.toString());
  store.setStringList("id", list);
}
