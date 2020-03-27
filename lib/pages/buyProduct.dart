import 'package:flutter/material.dart';
import 'package:tuvaro/components/futu_update.dart';
import 'package:tuvaro/components/futuaddproduct.dart';
import 'package:tuvaro/widgets/futu_money.dart';

class BuyProduct extends StatefulWidget {
  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  TextEditingController compra = TextEditingController();
  TextEditingController nomcompra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Card(
          borderOnForeground: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("ingresa datos",style: TextStyle(fontSize: 25)),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                controller: compra,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(
                      icon: Icon(Icons.monetization_on), onPressed: () {}),
                  labelText: 'costo',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: nomcompra,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(
                      icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
                  labelText: 'nombre de tu compra',
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('cancelar',
                        style: TextStyle(fontSize: 25, color: Colors.red)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: const Text('Guardar',
                        style: TextStyle(fontSize: 25, color: Colors.green)),
                    onPressed: () async{
                      var _dinH = await ObtenerMoney();
                      double dintotal = double.parse(_dinH);
                      double restcompra = double.parse(compra.text);
                      double newrest = dintotal - restcompra;
                      UpdateM(newrest.toString(),context);
                      AddProduct(nomcompra.text.toString(),compra.text.toString());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
