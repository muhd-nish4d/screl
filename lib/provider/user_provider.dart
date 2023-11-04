import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:screl/models/enums/fetch_status.dart';
import 'package:screl/models/user_model/user_model.dart';
import 'package:screl/services/api/api_call.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> userData = [];
  late FetchStatus status;
  void getUserData() async {
    status = FetchStatus.loading;
    notifyListeners();
    try {
      final models = await ApiCall.getUserDetails();
      userData = models ?? [];
      status = FetchStatus.succes;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      status = FetchStatus.failed;
      notifyListeners();
    }
  }
}
