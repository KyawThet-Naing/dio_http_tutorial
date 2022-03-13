import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_demo/models/user_model.dart';
import 'package:dio_demo/utils/app_const.dart';
import 'package:http/http.dart' as http;

class API {
  static Dio dio = Dio();
  static Map<String, String> headers = {"Content-Type": "application/json"};

  static Future<List<UserModel>?> getUserByHttp() async {
    Uri url = Uri.parse('$baseURL/user');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;

      final users = data.map((e) => UserModel.fromJson(e)).toList();

      return users;
    } else {
      //if error
      return null;
    }

    ///
  }

  static Future<List<UserModel>?> getUserByDio() async {
    String dioURL = '$baseURL/user';
    Response response = await dio.get(dioURL);

    if (response.statusCode == 200) {
      var data = response.data as List;

      final users = data.map((e) => UserModel.fromJson(e)).toList();

      return users;
    } else {
      //if error
      return null;
    }

    ///
  }

  static Future<bool> deleteUserByHttp({required String id}) async {
    Uri url = Uri.parse('$baseURL/user/$id');
    http.Response response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteUserByDio({required String id}) async {
    String url = '$baseURL/user/$id';
    Response response = await dio.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> userRegisterByHttp({
    required String name,
    required String age,
  }) async {
    final body = {
      "name": name,
      "age": int.parse(age),
    };

    ///post req
    http.Response response = await http.post(
      Uri.parse('$baseURL/user/'),
      headers: headers,
      body: jsonEncode(body),
    );

    ///status code
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> userRegisterByDio({
    required String name,
    required String age,
  }) async {
    final body = {
      "name": name,
      "age": int.parse(age),
    };

    Response response = await dio.post('$baseURL/user', data: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> userUpdateByDio(
      {required String name, required String age, required String id}) async {
    final body = {
      "name": name,
      "age": int.parse(age),
    };

    Response response = await dio.put(
      '$baseURL/user/$id',
      data: body,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> userUpdateByHttp(
      {required String name, required String age, required String id}) async {
    final body = {
      "name": name,
      "age": int.parse(age),
    };

    ///post req
    http.Response response = await http.put(
      Uri.parse('$baseURL/user/$id'),
      headers: headers,
      body: jsonEncode(body),
    );

    ///status code
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
