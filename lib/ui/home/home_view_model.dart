import 'package:stacked/stacked.dart';

import '../../models/users.dart';
import '../../services/api/home_api.dart';

class HomeViewModel extends BaseViewModel {
  late List<dynamic>? userData = [];
  late String? responseMessage = '';

  Future<void> initialise() async {
    callApi();
  }

  Future<UserData?> getUsers() async {
    final UserData? result = await HomeApi?.getUsers();

    userData = result?.data;
    responseMessage = result?.message;
    notifyListeners();
  }

  void callApi() async {
    setBusy(true);

    await getUsers();
    setBusy(false);
  }
}
