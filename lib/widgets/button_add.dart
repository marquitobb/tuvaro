import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuvaro/pages/principal.dart';
import 'dart:async';
import 'dart:convert';
import 'package:tuvaro/widgets/futu_money.dart';

class ButtonAdd extends StatefulWidget {
  @override
  _ButtonAddState createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context, builder: (ctx) => BottomSheetExample()
        );
      },
      icon: Icon(Icons.monetization_on),
      label: Text("añadir dinero a tu cuenta"),
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //TextField controller
  TextEditingController cant_dinero = TextEditingController();
 
  Future<dynamic> UpdateMoney(String cantnew) async{
    
    String cant = cant_dinero.text;
    var url = "https://morning-mesa-89802.herokuapp.com/money/update?money=$cantnew" ;
    //var url = "http://192.168.1.71:3000/money/update?money=$cant" ;
    http.Response data = await http.get(url);
    if (data.body == "si") {
      print("si actualizo");
      cant_dinero.text = "";
      Navigator.push(context, MaterialPageRoute(builder: (context) => Principal()));
    }else{
      print("ERROR no jala");
      cant_dinero.text = "comprueba tu conexion a internet";
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 800,
        width: 500,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 0.0),
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.white70,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Agrega mas dinero',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
              //Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                controller: cant_dinero,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(icon: Icon(Icons.monetization_on), onPressed: (){}),
                  labelText: 'Añadir mas dinero',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                alignment: Alignment.center,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                  label: Text(
                    'guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    var dinHay = await ObtenerMoney();

                    double dinHayInt = double.parse(dinHay);
                    double newMoney = double.parse(cant_dinero.text);
                    double sumDinero = dinHayInt+newMoney;
                    String cantnew = sumDinero.toString();
                    print(cantnew);
                    UpdateMoney(cantnew);
                    setState(() {
                      
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
