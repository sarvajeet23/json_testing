import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_testing/pages/home/components/model/user_model.dart';

Future<List<UserModelList>> getUserData() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

  http.Response res = await http.get(url);
  List userList = jsonDecode(res.body);
  //log(userList.toString());
  //this is the jsonDecode
  List<UserModelList> userData =
      userList.map((json) => UserModelList.fromJson(json)).toList();

  return userData;
}
