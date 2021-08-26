import 'package:stacked/stacked.dart';

import '../../models/users.dart';
import '../../services/api/home_api.dart';

class HomeViewModel extends BaseViewModel {
  late List<dynamic>? homeData = [];
  final HomeApi? homeApi;

  HomeViewModel({this.homeApi});

  Future<void> initialise() async {
    callApi();
  }

  Future<UserData?> getUsers() async {
    final UserData? result = await HomeApi?.getUsers();

    homeData = result?.data;
    notifyListeners();
  }

  void callApi() async {
    setBusy(true);

    await getUsers();
    setBusy(false);
  }
}
