import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/cadastro.dart';
import 'package:travelseller/pages/informacoesCliente.dart';
import '../database/controllers/cliente_controller.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  //Future<List<Cliente>>? futureClientes;
  final controller = ClienteController();
  List<Cliente> lista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lista = controller.readAll();
      //futureClientes = controller.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          const TopBar(
            imagem: Images.imagemClientes,
            titulo: Titles.tituloClientes,
          ),
          Container(
            height: altura * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(Titles.subTituloClientes,
                        style: Styles.subTituloPagina)
                  ]),
                  Row(children: [
                    Text("CONF",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: altura * 0.58,
            width: largura * 0.92,
            child: Container(
                decoration: Styles.decorationTile,
                child: ListView.builder(
                    padding: const EdgeInsets.all(7),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      int id = 0;
                      if (lista.isNotEmpty) {
                        id = lista[index].id;
                      }
                      return lista.isEmpty
                          ? const Center(child: Text("Sem clientes ..."))
                          : Container(
                              padding: const EdgeInsets.all(3),
                              child: Card(
                                  child: ListTile(
                                      leading: CustomIcons.iconeClienteTile,
                                      title: Text(lista[index].nome.toString()),
                                      onTap: () {
                                        Cliente cliente =
                                            ClienteController().read(id);
                                        TextEditingController nomeController =
                                            TextEditingController(
                                                text: cliente.nome);
                                        TextEditingController cpfController =
                                            TextEditingController(
                                                text: cliente.cpf!);
                                        TextEditingController rgController =
                                            TextEditingController(
                                                text: cliente.rg!);
                                        TextEditingController
                                            nascimentoController =
                                            TextEditingController(
                                                text: cliente.dataNascimento!);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    InformacoesCliente(
                                                      cliente: cliente,
                                                      nomeController:
                                                          nomeController,
                                                      cpfController:
                                                          cpfController,
                                                      rgController:
                                                          rgController,
                                                      nascimentoController:
                                                          nascimentoController,
                                                    ))));
                                      })));
                    })

                /*FutureBuilder<List<Cliente>>(
                  future: futureClientes,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final listaClientes = snapshot.data!;

                      return listaClientes.isEmpty
                          ? const Center(child: Text("Sem clientes ..."))
                          : ListView.builder(
                              padding: const EdgeInsets.all(7),
                              itemCount: listaClientes.length,
                              itemBuilder: (context, index) {
                                final cliente = listaClientes[index];
                                return Card(
                                    child: ListTile(
                                  leading: CustomIcons.iconeClienteTile,
                                  title: Text(cliente.nome.toString()),
                                ));
                              });
                    }
                  },
                )*/
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Cadastro())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
