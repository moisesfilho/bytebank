import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: FormularioTranferencia(),
      ),
    );
  }
}

class FormularioTranferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Tranferências'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final tranferenciaCriada = Tranferencia(valor, numeroConta);
                var menssagemSucesso = 'Tranferência criada com sucesso.';
                showMessage(context, menssagemSucesso);
              } else {
                var menssagemFaltandoDados = 'Necessário número da conta e valor.';
                showMessage(context, menssagemFaltandoDados);
              }
            },
          )
        ],
      ),
    );
  }

  void showMessage(BuildContext context, String menssagemSucesso) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(menssagemSucesso),
    ));
  }
}

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTranferencia(Tranferencia(100.0, 1234)),
          ItemTranferencia(Tranferencia(101.0, 1234)),
          ItemTranferencia(Tranferencia(102.0, 1234))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
    );
  }
}

class ItemTranferencia extends StatelessWidget {
  final Tranferencia _tranferencia;

  ItemTranferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_tranferencia.valor.toString()),
      subtitle: Text(_tranferencia.numeroConta.toString()),
    ));
  }
}

class Tranferencia {
  final double valor;
  final int numeroConta;

  Tranferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
