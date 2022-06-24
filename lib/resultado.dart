import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() reload;
  final int pontuacao;
  const Resultado(this.reload, this.pontuacao);

  String fraseResultado(int pontuacao) {
    if (pontuacao < 8) {
      return "Parabéns";
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Inpressionante';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child:
                Text(fraseResultado(pontuacao), style: TextStyle(fontSize: 28)),
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
          Text(pontuacao.toString()),
        ],
      ),
    );
  }
}
