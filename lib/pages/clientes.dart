import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/database/model/cliente.dart';

import '../database/controllers/cliente_controller.dart';
import '../database/object_box.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  Future<List<Cliente>>? futureClientes;
  final controller = ClienteController(ObjectBox());

  @override
  void initState() {
    super.initState();

    setState(() {
      futureClientes = controller.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    /*List<Cliente> lista = <Cliente>[
      Cliente(
          nome: "Enzo Andrade Terra",
          cpf: "08412684109",
          rg: "2390557",
          dataNascimento: "12/04/2004",
          idViagem: 1),
      Cliente(
          nome: "Giovanna Andrade Terra",
          cpf: "08412684109",
          rg: "2390557",
          dataNascimento: "12/04/2004",
          idViagem: 1),
      Cliente(
          nome: "Paolla Andrade Terra",
          cpf: "08412684109",
          rg: "2390557",
          dataNascimento: "12/04/2004",
          idViagem: 1),
    ];*/
    //List<Cliente> lista = ClienteController().readAll() as List<Cliente>;

    return Scaffold(body: Column(
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
                  Text(Titles.subTituloClientes, style: Styles.subTituloPagina)
                ]),
                Row(children: [
                  Text("CONF",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
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
              child: FutureBuilder<List<Cliente>>(
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
              )),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.create("Enzo Andrade Terra", "08412684109", "2390557", "12/04/2004", 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
