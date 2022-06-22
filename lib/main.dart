import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  //ESTADO GERENCIADO NESSA CLASSE

  int _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Coelho', 'Cobra', 'Elefante']
    },
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Amarelo'],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Pedro', 'José'],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        if (temPerguntaSelecionada) {}
        _perguntaSelecionada++;
      });
    }
    //print(_perguntaSelecionada);
  }

  void reset() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
        backgroundColor: Color.fromARGB(255, 217, 18, 4),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder)
          // Column(
          //     children: <Widget>[
          //       Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
          //       ...respostas.map((e) => Resposta(e, _responder)).toList(),
          //     ],
          //   )
          : Resultado(reset),
    ));
  }
}

//class PerguntaApp extends StatelessWidget {}
