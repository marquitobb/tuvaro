import 'package:flutter/material.dart';
import 'package:tuvaro/widgets/button_add.dart';
import 'package:tuvaro/widgets/futu_money.dart';

class Principal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('tuVaro'),
        ),
        body: FutureBuilder(
          future: ObtenerMoney(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("no hay datos"),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tu dinero es de:"),
                    Text("${snapshot.data}"),
                    ButtonAdd()
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Name {
  String din;

  Name(this.din);
}