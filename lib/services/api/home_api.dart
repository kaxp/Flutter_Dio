import 'dart:async';

import '../../models/users.dart';
import '../../services/constants/endpoints.dart';

import '../dio_client.dart';

abstract class HomeApi {
  HomeApi._();

  /// Returns list of users in response
  static Future<UserData> getUsers() async {
    try {
      final res = await DioClient.get(Endpoints.getUsers);

      return UserData.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
