import 'dart:convert';

import 'package:flutter_project/model/users.model.dart';
import 'package:http/http.dart'as http;

class UsersRepository{
Future<ListUsers> searchUsers(String keyword,int page,int pageSize)async{
  String url="https://api.github.com/search/users?q=$keyword&page=$page&per_page=$pageSize";

  try{
    http.Response res = await http.get(Uri.parse(url));
    if(res.statusCode==200){
      Map<String,dynamic> listUsersMap= json.decode(res.body);
      ListUsers listUsers=ListUsers.fromJson(listUsersMap);
      return listUsers;
    }else{
      return throw("Err=>${res.statusCode}");
    }
  }catch(ex){
    return throw("Error=>"+ex.toString());
  }
}
}