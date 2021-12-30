import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_ebusiness/model/data_json_roti.dart';

class TarikData {
  final url = 'https://datadumy.000webhostapp.com/api/bluder';

  Future getDataRoti() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = json.decode(response.body);
        List<DataRoti> data = it.map((e) => DataRoti.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
