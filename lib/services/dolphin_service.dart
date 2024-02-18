import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/core/constants/strings.dart';
import 'package:new_app/models/dolphin_model.dart';
import '../core/constants/utils.dart';

class DolphinService {

  static Future<DolphinModel> fetchRandomDolphinPhoto() async {
    try {
      final response = await http.get(Uri.parse(ConstStrings.apiUrl));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        return DolphinModel.fromMap(jsonData);
      } else {
        showToast(text: "Failed to load dolphin photo");
        throw Exception('Failed to load dolphin photo. Status code: ${response.statusCode}');
      }
    } catch (e) {
      showToast(text: "Check your Network ");
      throw Exception('Error: $e');
    }
  }
}
