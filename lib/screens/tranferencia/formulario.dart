import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Tranferências';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.0';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _textBotaoConfirmar = 'Confirmar';
const _textoFalha = 'Verifique se os campos estão preenchidos corretamente.';

class FormularioTranferencia extends StatefulWidget {
  @override
  _FormularioTranferenciaState createState() => _FormularioTranferenciaState();
}

class _FormularioTranferenciaState extends State<FormularioTranferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            Builder(builder: (context) {
              return RaisedButton(
                child: Text(_textBotaoConfirmar),
                onPressed: () => _criaTranferencia(context),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final tranferenciaCriada = Tranferencia(valor, numeroConta);
      Navigator.pop(context, tranferenciaCriada);
    } else {
      showMessage(context, _textoFalha);
    }
  }

  void showMessage(BuildContext context, String menssagemSucesso) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(menssagemSucesso)),
    );
  }
}
