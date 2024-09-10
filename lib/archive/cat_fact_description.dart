// // https://alexwohlbruck.github.io/cat-facts/docs/models/fact.html
//
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
//
// class CatFactDescription{
//   final String id;
//   final String text;
//   // final String source;
//   // final bool verified;
//
//   CatFactDescription({required this.id,
//     required this.text,
//     // required this.source,
//     // required this.verified
//   });
//
//   // factory CatFactDescription.fromJson(Map <dynamic, dynamic> json) {
//     factory CatFactDescription.fromJson(Map <String, dynamic> json) {
//     // return CatFactDescription(id: json['_id'], text: json['text'], source: json['source'], verified: json['status.verified']);
//     return CatFactDescription(
//         id: json['_id'],
//         text: json['text'],
//         // source: json['source'],
//         // verified: json['status']
//     );
//
//   }
//
// }