import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<String> ObtenerMoney() async{
    http.Response data = await http.get("https://morning-mesa-89802.herokuapp.com/money");
    //http.Response data = await http.get("http://192.168.1.71:3000/money");
    //Map<String, dynamic> jsondata = json.decode(data.body);
    var dt = json.decode(data.body);
    List<User> dd = [];
    //print(info);
    
    for (var i in dt) {
      User user = User(i["name"],i["money"]);

      dd.add(user);
    }
    
    
    String jiji = dd[0].money;

    return jiji;
    //money = dinero;
}

class User{
  final String name;
  final String money;
  
  User(this.name,this.money);

}