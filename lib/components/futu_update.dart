import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuvaro/pages/principal.dart';

Future<dynamic> UpdateM(String cant, context) async{
    
    var url = "https://morning-mesa-89802.herokuapp.com/money/update?money=$cant" ;
    //var url = "http://192.168.1.71:3000/money/update?money=$cant" ;
    http.Response data = await http.get(url);
    if (data.body == "si") {
      print("si actualizo");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Principal()));
    }else{
      print("ERROR no jala");
      
    }
}