import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Models/user.dart';

class UserController extends GetxController{
  final users = <User>[].obs;
  var isLogged = false.obs;

  void fromJson(List<Map<String, dynamic>> json){
    json.map((e){
      var new_element = User(
        id: users.last.id+1, 
        name: e["name"], 
        mail: e["mail"], 
        birth: e["birth"], 
        phone: e["phone"], 
        password: encrypt(e["password"]));
      users.assign(new_element);
    });
  }

  String encrypt(String pwd){
    final bytes = utf8.encode(pwd);
    final convert = sha256.convert(bytes);
    return convert.toString();
  }

  void login(String mail, String password){
    for (var element in users) {
      if(element.mail == mail && element.password == encrypt(password)){
        isLogged.value = true;
      }
    }
  }

  void logout(){
    isLogged.value = false;
  }
}