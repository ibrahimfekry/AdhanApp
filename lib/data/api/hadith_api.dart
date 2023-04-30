import 'dart:convert';

import 'package:http/http.dart' as http;

class HadithApi{
  static Future <List<dynamic>>getAllHadith()async{
    try {
      http.Response response = await http.get(Uri.parse(
          'https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=300'));
      Map allHadith = jsonDecode(response.body);
      List hadithList = allHadith['items'];
      return hadithList;
    } catch (e) {
      return [];
    }
  }
}
// import 'dart:convert';
//
// import 'package:adhan_app/data/model/hadith_model.dart';
// import 'package:http/http.dart' as http;
//
// class HadithApi{
//   static Future <List<HadithModel>>getAllHadith()async{
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://hadeethenc.com/api/v1/hadeeths/one/?language=ar&id=2962'));
//       Map allHadith = jsonDecode(response.body);
//       List hadithList = allHadith['items'];
//       print('api :::: ${hadithList[1]}');
//       return allHadith['items'];
//     } catch (e) {
//       return [];
//     }
//   }
//
// }