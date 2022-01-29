import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodie/utils/storage_manager.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class UserRepository {
  static Future<List> getStores() async {
    var res = await http.get(Uri.parse(baseURL + "/store"));
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }

  static Future<List> getProducts(String storeID) async {
    print(storeID);
    var res = await http
        .get(Uri.parse("$baseURL/getProductsfromSingleStore/$storeID"));
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }

  static Future login(int phoneNo, String password) async {
    var body = {"mobileNo": phoneNo.toString(), "password": password};
    var res = await http.post(Uri.parse(baseURL + "/login"), body: body);
    var login = jsonDecode(res.body);
    print(login);
    Fluttertoast.showToast(msg: login['message']);
    if (login != null && login['data'] != null && login['token'] != null) {
      StorageManager.saveData('token', login['token']);
      StorageManager.saveData('id', login['data']['_id']);
      StorageManager.saveData('name', login['data']['name']);
      StorageManager.saveData('regNo', login['data']['regNo']);
      StorageManager.saveData('role', login['data']['role']);
      Fluttertoast.showToast(msg: login['message']);
      return login;
    } else {
      Fluttertoast.showToast(msg: "Somthing went wrong");
    }
  }

  static Future signup(
      String name,
      String regNo,
      int mobileNo,
      String password,
      String email,
      String dob,
      String gender,
      String address,
      String dept) async {
    var body = {
      "name": name,
      "mobileNo": mobileNo.toString(),
      "password": password,
      "email": email,
      "dateOfBirth": dob,
      "gender": gender,
      "address": address,
      "regNo": regNo,
      "dept": dept
    };
    var res = await http.post(Uri.parse(baseURL + "/user"), body: body);
    return jsonDecode(res.body);
  }
}
