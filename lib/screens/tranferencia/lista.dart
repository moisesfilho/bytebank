import 'package:bytebank/models/tranferencia.dart';
import 'package:bytebank/screens/tranferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Tranferências';
const _textoTranferenciaComSucesso = 'Transferência criada com sucesso.';

class ListaTranferencias extends StatefulWidget {
  final List<Tranferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

class ListaTranferenciasState extends State<ListaTranferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final tranferencia = widget._transferencias[index];
          return ItemTranferencia(tranferencia);
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormularioTranferencia();
              })).then(
                (tranferenciaRecebida) => atualiza(tranferenciaRecebida, context),
              );
            },
          );
        }
      ),
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
    );
  }

  void atualiza(Tranferencia tranferenciaRecebida, BuildContext context) {
    if (tranferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(tranferenciaRecebida);
        showMessage(context, _textoTranferenciaComSucesso);
      });
    }
  }

  void showMessage(BuildContext context, String menssagemSucesso) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(menssagemSucesso),
    ));
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
