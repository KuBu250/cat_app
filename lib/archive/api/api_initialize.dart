// import 'dart:async';
// import 'dart:convert';
// // import 'dart:js_interop';
//
// import 'package:cat_app/Models/cat_fact_description.dart';
// import 'package:cat_app/Models/cat_model.dart';
// import 'package:cat_app/Models/meow_facts.dart';
// import 'package:http/http.dart' as http;
//
//
//
// late List<MeowFacts> meowFactsList = [];
// late List<MeowFacts> meowFactsListFuture = [];
// // late Future<List<MeowFacts>> meowFactsListFuturee = [];
//
// late String name;
// // List<String> stringList = jsonDecode(response.body).cast<String>();
// // List<String> stringList = jsonDecode(name).cast<String>();
// List<String> stringList = meowFactsListFuture.cast<String>();
// List<String> stringList2 = meowFactsListFuture.cast<String>();
// List<String> stringList3 = [];
//
//
// Future<List<MeowFacts>>fetchMeowFacts() async {
// // Future<String>fetchMeowFacts() async {
//   var url = Uri.parse('https://meowfacts.herokuapp.com/?count=3');
//   final response = await http.get(url);
//   print('Printing: response status code: ${response.statusCode}');
//   print(response.body);
//   if (response.statusCode == 200) {
//     List<dynamic> decodedJson = jsonDecode(response.body)['data'];
//     // List<MeowFacts> meowFactsList = decodedJson.map((json) => MeowFacts.fromJson(json)).toList();
//     List<MeowFacts> meowFactsList = decodedJson.map((fact) => MeowFacts(meow_facts: [fact.toString()])).toList();
//     return meowFactsList;
//
//     // List<dynamic> jsonResponse = jsonDecode(response.body);
//     // return jsonResponse.map((data) => MeowFacts.fromJson(data)).toList();
//
//
//   // if (response.statusCode == 200) {
//   //   Map<String, dynamic> decodedJson = jsonDecode(response.body);
//   //   String name = decodedJson['data'];
//   //   String encoder = jsonEncode(name);
//   //   stringList3.add(encoder);
//   //   return encoder;
//     // meowFactsListFuture.add(encoder);
//     // Map<String, dynamic> decodedJson = jsonDecode(response.body);
//     // String name = decodedJson['data'];
//     // meowFactsListFuture = name;
//     // for (var eachElement in decodedJson['data']) {
//     //   // return stringList2.add(eachElement);
//     //   return meowFactsListFuturee.add(eachElement);
//     // }
//
//     // Map<String, dynamic> decodedJson = jsonDecode(response.body);
//     // String name = decodedJson['data'];
//     // // List<String> stringListMeowFacts = jsonDecode(response.body).cast<String>();
//     // // return name;
//     // // return stringList;
//     // return meowFactsListFuture = decodedJson['data'];
//
//     // var jsonData = jsonDecode(response.body);
//     //
//     // final meowFact = MeowFacts.fromJson(jsonData);
//     // meowFactsList.add(meowFact);
//     // print('Printing: meowFactsList:');
//     // print(meowFactsList);
//     // // String meowDescribed = meowFactsList['data'];
//     //
//     // return meowFactsList;
//
//     // List<dynamic> jsonResponse = jsonDecode(response.body);
//     // List<MeowFacts> jsonResponsee = jsonDecode(response.body);
//
//     // return jsonResponse.map((data) => MeowFacts.fromJson(data)).toList();
//   } else {
//     // print('Could not receive succesfully jsonResponse. Status code: ${response.statusCode}');
//     throw Exception('Could not receive successfully jsonResponse. Status code: ${response.statusCode}');  }
//   throw Exception('Could not receive succesfully jsonResponse. Status code: ${response.statusCode}');
//
// }
//
//
//
//   // Fetch Cats Description (1) working
// // List<CatFactDescription> catsDescribedFacts = [];
//
// //---------------------------------------------wyszarzone 07.09.2024
// // List<CatFactDescription> catFactList = [];
// //
// // // Future<void> fetchCatFacts() async {
// // Future<List<CatFactDescription>> fetchCatFacts() async {
// //   var response =
// //   // await http.get(Uri.https('cat-fact.herokuapp.com', '/facts/random'));
// //   await http.get(Uri.https('cat-fact.herokuapp.com', '/facts/random', {'animal_type': 'cat', 'amount': '1'}));
// //   // await http.get(Uri.https('cat-fact.herokuapp.com', '/facts/'));
// //
// //   print(response);
// //   print(response.body);
// //
// //   var jsonData = jsonDecode(response.body);
// //
// //   final catFact = CatFactDescription.fromJson(jsonData);
// //   catFactList.add(catFact);
// //   return catFactList;
// // }
// //---------------------------------------------wyszarzone 07.09.2024
//
// //
// // //---------
// // //Up is working
//
//
//
//
// // Future<List<CatFactDescription>> fetchCatFacts() async {
// //   // https://cat-fact.herokuapp.com
// //   var url = Uri.https('cat-fact.herokuapp.com', '/facts/random');
// //
// //   // var url = Uri.https('cat-fact.herokuapp.com', '/facts/random', {'animal_type': 'cat', 'amount': '3'});
// // // var url = Uri.parse('https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=3');
// //   // var url = Uri.parse('cat-fact.herokuapp.com', 'facts/random?animal_type=cat&amount=3');
// //   final response = await http.get(url);
// //
// //   if (response.statusCode == 200) {
// //     print('Facts status code: ${response.statusCode}');
// //     List<dynamic> jsonResponse = json.decode(response.body);
// //     return jsonResponse.map((json) => CatFactDescription.fromJson(json)).toList();
// //
// //     // List<dynamic> jsonResponse = jsonDecode(response.body);
// //     // List<CatFactDescription> catsDescribedFacts = jsonResponse.map((data) => CatFactDescription.fromJson(data)).toList();
// //     // return catsDescribedFacts;
// //
// //     // for (var eachJsonElement in jsonResponse) {
// //     //   catsDescribedFacts = jsonResponse.map((data) => CatFactDescription.fromJson(data)).toList();
// //     //   return catsDescribedFacts;
// //       // catsDescribedFacts.add(CatFactDescription.fromJson(eachJsonElement));
// //       // return catsDescribedFacts;
// //     // }
// //     // return jsonResponse.map((data) => CatFactDescription.fromJson(data)).toList();
// //
// //
// //     // List<CatFactDescription> parseCatFacts(String responseBody) {
// //     //   final parsed = jsonDecode(responseBody);
// //     //   final List<dynamic> jsonResponse = parsed['text'];
// //     //   return jsonResponse.map<CatFactDescription>((data) => CatFactDescription.fromJson(data)).toList();
// //     // }
// //     // parseCatFacts;
// //
// //   } else {
// //     throw Exception('Failed to load described cat fact. Status code: ${response.statusCode}');
// //   }
// // }
// //------
//
//   //
//   // Future<List<CatModel>> fetchData() async {
//   //   final response = await http.get(Uri.parse(apiUrl));
//   //   print(response.body);
//   //
// //   try{
// //     if (response.statusCode == 200) {
// //       Map catsJsonDataDecoded = jsonDecode(response.body);
// //       // print(catsJsonDataDecoded);
// //       List<dynamic> catsListData = catsJsonDataDecoded['url'];
// //
// //       // List<dynamic> catsListData = catsJsonDataDecoded[0];
// //
// //       // var catsListData = catsJsonDataDecoded['url'];
// //
// //       for (var catPhotoItem in catsListData) {
// //         cats.add(CatModel.fromJson(catPhotoItem));
// //   }
// //   } else {
// //       print(response.statusCode);
// //   Future.error(('Something errror, \nStatus Code: ${response.statusCode}'));
// //   }
// //
// //   } catch (e) {
// //     print(response.statusCode);
// //
// //     Future.error('Something error, $e');
// //   }
// //   return cats;
// // }
// // }
//
//
//
//
