import 'dart:convert';
import 'package:banklocator/repository/bankApi.dart';
import 'package:http/http.dart' as http;

String bankApi = BankApi().bankApi;


Future fetchBanks() async {
  /// fetch data
  final response = await http.get(bankApi);
  if(response.statusCode == 200) {
    /// if server return a 200 OK response then parse JSON
    List<dynamic> jsonData  =
    jsonDecode(response.body)['data'];
    return jsonData;
  } else {
    throw Exception('Failed to load banks');
  }

}