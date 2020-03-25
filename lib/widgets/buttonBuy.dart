import 'package:flutter/material.dart';
import 'package:tuvaro/pages/buyProduct.dart';

class ButtonBuy extends StatefulWidget {
  @override
  _ButtonBuyState createState() => _ButtonBuyState();
}

class _ButtonBuyState extends State<ButtonBuy> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BuyProduct()));
      },
      icon: Icon(Icons.add_shopping_cart),
      label: Text("guardar compra"),
    );
  }
}


