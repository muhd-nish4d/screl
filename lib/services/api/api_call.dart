import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:screl/models/user_model/user_model.dart';
import 'package:screl/services/api/api.dart';

class ApiCall {
  static Future<List<UserModel>?> getUserDetails() async {
    try {
      final uri = Uri.parse(ApiEndPoints.baseUrl);
      log(uri.toString());
      final https.Response response = await https.get(uri);

      if (response.statusCode == 200) {
        final List<UserModel> models = [];

        for (final json in jsonDecode(response.body)) {
          final user = UserModel.fromJson(json);
          models.add(user);
        }

        return models;
      } else {
        log('something fisshi');
        throw Exception('Failed to get DoctorModels');
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
