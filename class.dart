import 'dart:convert';

import 'package:http/http.dart';

class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class ApiService {
  String endpoint = "https://reqres.in/api/users?page=1";
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
