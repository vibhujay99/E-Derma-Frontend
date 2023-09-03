import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_derma/app_config.dart';
import 'package:http/http.dart' as http;
import '../global/global_user.dart';
import '../models/user_model.dart';

class AuthService {
  final dio = Dio();
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    var response;
    String? err;
    final _ = await dio.post("$backendUrl/login_user", data: {
      "email": email,
      "password": password,
    }).then((value) {
      print(value.data);
      response = value.data;
      GlobalUser.currentUser = User(
        name: response['name'],
        email: response['email'],
        phoneNum: response['mobile_number'],
        dateOfBirth: '',
      );
    }).catchError((e){
      if(e is DioException) {
        print(e.response);
        err = e.response?.data.toString();
      }
    });

    return {
      'success': response == null ? false : response["success"] ,
      'msg': response == null ? err: response["msg"],
      'token':response == null ? '': response["token"] ?? ''
    };
  }

  register(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String dateOfBirth}) async {
    var response;
    String? err;
    await dio.post("$backendUrl/register_user", data: {
      "email": email,
      "password": password,
      "name": name,
      "mobile_number": phoneNumber,
    }).then((value) {
      response = value.data;

      //setting the current user
      if (response["success"]) {
        GlobalUser.currentUser = User(
          name: name,
          email: email,
          phoneNum: phoneNumber,
          dateOfBirth: dateOfBirth,
        );
      }
    }).catchError((e) {
      if(e is DioException) {
        print(e.response?.data);
        err=e.response?.data;
      }
    });
    return {
      'success': response==null? false: response["success"],
      'msg': response==null? err.toString(): response["msg"],
    };
  }

  getInfo() async {
    var response;

    try {
      await http.get(
          Uri.parse(
              "https://paddy-backend-new-h43zk.ondigitalocean.app/getinfo"),
          headers: {
            'Authorization': 'Bearer ${GlobalUser.authToken}'
          }).then((value) {
        response = jsonDecode(value.body);
        GlobalUser.currentUser = User(
            name: response['name'],
            email: response['email'],
            phoneNum: response['phoneNumber'],
            dateOfBirth: '');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  sendPasswordResetRequest(email) async {
    var response;

    try {
      await http.post(
          Uri.parse(
              "https://paddy-backend-new-h43zk.ondigitalocean.app/reset-password"),
          body: {'email': "menuradulsara@gmail.com"}).then((value) {
        response = jsonDecode(value.body);
        print(response['message']);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updatePassword(String email, String otp, String password) async {
    var response;

    try {
      await http.put(
          Uri.parse(
              "https://paddy-backend-new-h43zk.ondigitalocean.app/update-password"),
          body: {
            'email': email,
            'OTP': otp,
            'newPassword': password
          }).then((value) {
        response = jsonDecode(value.body);
        print(response);
      });
    } catch (e) {
      print(e.toString());
    }
    return response['msg'];
  }

  updateInfo(String email, String name, String phoneNumber) async {
    var response;

    try {
      await http.put(
          Uri.parse(
              "https://paddy-backend-new-h43zk.ondigitalocean.app/update-info"),
          body: {
            'email': email,
            'name': name,
            'phoneNumber': phoneNumber
          }).then((value) {
        response = jsonDecode(value.body);
        print(response['msg']);
      });
    } catch (e) {
      print(e.toString());
    }

    return response['msg'];
  }
}
