import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/cadastroViagem.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({super.key});

  @override
  ListaClientesState createState() => ListaClientesState();
}

class ListaClientesState extends State<ListaClientes> {
  final controller = ClienteController();
  List<Cliente> lista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lista = controller.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
            child: SizedBox(
                width: largura * 0.9,
                height: altura * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 50,
                        child: Text(
                          "Escolha um cliente",
                          style: CustomStyles.subTituloCadastro,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: altura * 0.58,
                        width: largura * 0.92,
                        child: Container(
                            decoration: CustomStyles.decorationTile,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(7),
                                itemCount: lista.length,
                                itemBuilder: (context, index) {
                                  int id = 0;
                                  if (lista.isNotEmpty) {
                                    id = lista[index].id;
                                  }
                                  return lista.isEmpty
                                      ? const Center(
                                          child: Text("Sem clientes ..."))
                                      : Container(
                                          padding: const EdgeInsets.all(3),
                                          child: Card(
                                              child: ListTile(
                                                  leading: CustomIcons
                                                      .iconeClienteTile,
                                                  title: Text(lista[index]
                                                      .nome
                                                      .toString()),
                                                  onTap: () {
                                                    Cliente cliente =
                                                        ClienteController()
                                                            .read(id);

                                                    showDialog<String>(
                                                        context: context,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  title: const Text(
                                                                      'Deseja tornar este o cliente responsável pela viagem?'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          context,
                                                                          'Cancelar'),
                                                                      child: const Text(
                                                                          'Cancelar'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: ((context) => CadastroViagem(jaTemCliente: true, cliente: cliente))));
                                                                      },
                                                                      child: const Text(
                                                                          'Sim'),
                                                                    ),
                                                                  ],
                                                                ));
                                                  })));
                                })))
                  ],
                ))));
  }
}
