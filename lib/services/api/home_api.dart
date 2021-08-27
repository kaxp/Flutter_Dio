import '../dio_client.dart';
import '../../models/users.dart';
import '../../services/constants/endpoints.dart';

abstract class HomeApi {
  HomeApi._();

  /// Returns list of users in response
  static Future<UserData> getUsers() async {
    try {
      final res = await DioClient.get(Endpoints.getUsers);

      return UserData.fromJson(res);
    } catch (e) {
      return UserData.fromJson({
        'data': [],
        'message': 'Something went wrong'
        // ignore: todo
      }); //TODO: Here the actual message that the server throws is to be used for displaying at UI.
    }
  }
}
