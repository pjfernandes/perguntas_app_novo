import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;
  Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(texto),
        onPressed: onSelection,
        color: Color.fromARGB(255, 110, 104, 104),
      ),
    );
  }
}
