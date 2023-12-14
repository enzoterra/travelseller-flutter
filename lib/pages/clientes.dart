import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/cadastro.dart';

import '../database/controllers/cliente_controller.dart';
import '../database/object_box.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  Future<List<Cliente>>? futureClientes;
  final controller = ClienteController();

  @override
  void initState() {
    super.initState();

    /*setState(() {
      futureClientes = controller.readAll();
    });*/
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
                    itemCount: controller.lerTodos().length,
                    itemBuilder: (context, index) {
                      final cliente = controller.lerTodos()[index];
                      return Card(
                          child: ListTile(
                        leading: CustomIcons.iconeClienteTile,
                        title: Text(cliente.nome.toString()),
                      ));
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
