import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<dynamic> AddProduct(String a,String b) async{
  var url = "https://morning-mesa-89802.herokuapp.com/products/add?product=$a&cost=$b";
  http.Response data = await http.get(url);
  
}