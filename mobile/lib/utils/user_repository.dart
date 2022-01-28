import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class UserRepository {
  static Future<List> getStores() async {
    var res = await http.get(Uri.parse(baseURL + "/store"));
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }

  static Future login(int phoneNo, String password) async {
    var body = {"mobileNo": phoneNo, "password": password};
    var res = await http.post(Uri.parse(baseURL + "/login"), body: body);
    var login = jsonDecode(res.body);
    print(login);
    Fluttertoast.showToast(msg: login['message']);
    if (login != null) {
      Fluttertoast.showToast(msg: login['message']);
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
      "mobileNo": mobileNo,
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
