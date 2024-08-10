import 'package:flutter/material.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/cadastro/cadastroViagem.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes(
      {super.key, required this.isCadastro, required this.viagem});

  final bool isCadastro;
  final Viagem viagem;

  @override
  ListaClientesState createState() => ListaClientesState();
}

class ListaClientesState extends State<ListaClientes> {
  final controller = ClienteController();
  List<Cliente> lista = [];
  List<Cliente> displayLista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lista = controller.readAll();
      displayLista = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    void filtrarResultados(String busca) {
      setState(() {
        displayLista = lista
            .where((cliente) =>
                cliente.nome.toLowerCase().contains(busca.toLowerCase()))
            .toList();
        if (busca != "") {
          displayLista.addAll(controller.readByAttributes(busca));
        }
      });
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
          child: SizedBox(
              width: largura * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          top: CustomDimens.marginTiles + 10),
                      child: const Text(
                        "Escolha um cliente",
                        style: CustomStyles.subTituloCadastro,
                      )),
                  Container(
                    margin: const EdgeInsets.only(
                        top: CustomDimens.marginTilesSmall - 10),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: SizedBox(
                          height: 50,
                          child: TextField(
                              decoration: const InputDecoration(
                                  labelText: "Procurar cliente",
                                  hintText: "Informe o nome do cliente",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))),
                              onChanged: (text) => filtrarResultados(text))),
                    ),
                  ),
                  SizedBox(
                      height: altura * 0.6,
                      child: Container(
                          decoration: CustomStyles.boxDecorationListas,
                          child: ListView.separated(
                              padding: const EdgeInsets.all(10),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                        thickness: 0.5,
                                      ),
                              itemCount: displayLista.length,
                              itemBuilder: (context, index) {
                                if (displayLista.isEmpty) {
                                  return const Center(
                                      child: Text("Sem clientes ..."));
                                } else {
                                  int id = displayLista[index].id;
                                  return ListTile(
                                      leading: CustomIcons.iconeClienteTile,
                                      title: Text(
                                          displayLista[index].nome.toString()),
                                      onTap: () {
                                        Cliente cliente =
                                            ClienteController().read(id);

                                        showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text(
                                                      'Deseja tornar este o cliente responsável pela viagem?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancelar'),
                                                      child: const Text(
                                                          'Cancelar'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        widget.isCadastro
                                                            ? Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: ((context) => CadastroViagem(
                                                                        jaTemCliente:
                                                                            1,
                                                                        cliente:
                                                                            cliente))))
                                                            : Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: ((context) => InformacoesViagem(
                                                                        viagem: widget
                                                                            .viagem,
                                                                        cliente:
                                                                            cliente))));
                                                      },
                                                      child: const Text('Sim'),
                                                    ),
                                                  ],
                                                ));
                                      });
                                }
                              }))),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 100,
                      child: MaterialButton(
                          padding: const EdgeInsets.only(left: 3),
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          child: const Row(
                            children: [
                              CustomIcons.iconBack,
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Voltar",
                                style:
                                    TextStyle(color: CustomColors.pretoIcones),
                              )
                            ],
                          )))
                ],
              ))),
    ));
  }
}
