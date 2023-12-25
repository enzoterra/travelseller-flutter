import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/cadastroCliente.dart';
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
            imagem: CustomImages.imagemClientes,
            titulo: CustomTitles.tituloClientes,
          ),
          Container(
            height: altura * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(CustomTitles.subTituloClientes,
                        style: CustomStyles.subTituloPagina)
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

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    InformacoesCliente(
                                                      cliente: cliente,
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const CadastroCliente())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
