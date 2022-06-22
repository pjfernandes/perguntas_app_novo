import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() reload;
  const Resultado(this.reload);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
        child: Text("Parabéns!", style: TextStyle(fontSize: 28)),
        margin: EdgeInsets.all(10),
      ),
      Container(
        child: RaisedButton(
          child: Text("Voltar"),
          onPressed: reload,
          color: Colors.red,
          textColor: Colors.white,
        ),
        margin: EdgeInsets.all(10),
      ),
    ]));
  }
}
