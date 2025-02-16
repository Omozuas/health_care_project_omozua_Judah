import 'dart:convert';

import 'package:automatedcountingapp/api/api_services.dart';
import 'package:automatedcountingapp/api/urls.dart';
import 'package:automatedcountingapp/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserApi {
  ApiService apiService = ApiService(baseUrl: baseUrl);
  UserApi(this.ref);
  final Ref ref;
  //get  user
  Future<List<UserModel>> getUser() async {
    try {
      final response = await apiService.get(endpoint: userUrl);
      List<dynamic> data = json.decode(response.body);
      List<UserModel> users = data.map((e) => UserModel.fromJson(e)).toList();
      return users;
    } catch (e) {
      rethrow;
    }
  }
}

final userApiProvider = Provider<UserApi>((ref) => UserApi(ref));
