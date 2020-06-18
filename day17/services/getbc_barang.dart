import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page4/barang.dart';

class GetbcBarang{
  List<Barang> parseBarang(String responseBody) { 
   final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>(); 
   return parsed.map<Barang>((json) => Barang.fromMap(json)).toList(); 
  } 
  Future<List<Barang>> getBarang() async { 
    try{
      final response = await http.get('http://localhost/getbc_app/Api/barang');
      return parseBarang(response.body); 
    }catch(e){
      throw Exception('error $e'); 
    }
  }
}
// rafikbojes, 2:00 PM 18/06/2020