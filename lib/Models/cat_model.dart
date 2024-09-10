import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CatModel{
  final String photo;

  CatModel({required this.photo});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
        photo: json['url']);
  }
}

ApiServices apiInitialize = ApiServices();
class ApiServices{
  final apiUrl = 'https://api.thecatapi.com/v1/images/search?limit=10';
  // final apiUrl = 'https://api.thecatapi.com/v1/images/search';
  late List<CatModel> cats = [];

  Future<List<CatModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => CatModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load cat images');
    }
  }
}