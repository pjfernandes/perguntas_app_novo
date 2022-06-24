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

  var _perguntaSelecionada = 0;

  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 8},
        {'texto': 'Elefante', 'pontuacao': 7},
      ]
    },
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 4},
        {'texto': 'Amarelo', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 7},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Pedro', 'pontuacao': 10},
        {'texto': 'José', 'pontuacao': 10},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void reset() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
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
                responder: (_pontuacaoTotal) => _responder(_pontuacaoTotal),
              )
            // Column(
            //     children: <Widget>[
            //       Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            //       ...respostas.map((e) => Resposta(e, _responder)).toList(),
            //     ],
            //   )
            : Resultado(reset, _pontuacaoTotal),
      ),
    );
  }
}

//class PerguntaApp extends StatelessWidget {}
