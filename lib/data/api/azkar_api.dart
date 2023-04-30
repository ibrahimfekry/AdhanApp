import 'dart:convert';

import 'package:http/http.dart'as http;
class AzkarApi{
  static Future<List <dynamic>> getAllAzkar()async
  {
      http.Response response = await http.get(Uri.parse('https://ayah.nawafdev.com/files/adkar.json'));
      return jsonDecode(response.body);
  }
}