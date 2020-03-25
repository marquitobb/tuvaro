import 'package:flutter/material.dart';
import 'package:tuvaro/widgets/buttonBuy.dart';
import 'package:tuvaro/widgets/button_add.dart';
import 'package:tuvaro/widgets/futu_money.dart';

class Principal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('tuVaro'),
        ),
        body: FutureBuilder(
          future: ObtenerMoney(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Image.asset("assets/bien.gif"),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tu dinero es de:", style: TextStyle(fontSize: 42),),
                    Text("${snapshot.data}",style: TextStyle(fontSize: 72)),
                    ButtonAdd(),
                    ButtonBuy()
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
