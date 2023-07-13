import 'dart:convert';

import 'package:covid_19/Model/record_model.dart';
import 'package:covid_19/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<RecordModel> fetchStatesApi() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RecordModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> fetchContriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    // final response =
    //     await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('error');
    }
  }
}
