import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_http/apis/request.dart';
import 'package:getx_http/model/user.dart';
import 'package:getx_http/model/userLoginRes.dart';
import '../utils/url.dart';

class HomeController extends GetxController {
  var userData = <Data>[].obs;
  var isLoading = true.obs;
  String token;

  @override
  void onInit() {
    _apiGetUser();
    _userLogin();
    super.onInit();
  }

  /// get User
  void _apiGetUser() async {
    isLoading(true);
    Request request = Request(url: userListUrl, body: null);
    request.get().then(
      (value) {
        if (value.statusCode == 200) {
          if (value.body.isNotEmpty) {
            User _userData = User.fromJson(json.decode(value.body));

            userData.value = _userData.data;

            ///response
            print(value.body);

            isLoading(false);
          }
        }
      },
    ).catchError((onError) {
      print(onError);
      isLoading(false);
    });
  }

  void _userLogin() async {
    print('---');
    try {
      Request request = Request(
          url: userLogin,
          body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});
      request.post().then((value) {
        print('---');
        print(value.statusCode);
        if (value.statusCode == 200) {
          if (value.body.isNotEmpty) {
            UserLoginRes _userLoginres =
                UserLoginRes.fromJson(json.decode(value.body));

            token = _userLoginres.token;
            print(token);
          }
        }
      }).catchError((onError) {
        print(onError);
      });
    } catch (e) {
      print(e);
    }
  }
}
