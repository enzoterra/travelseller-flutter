import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/cadastro/cadastroCliente.dart';
import 'package:travelseller/pages/informacoes/informacoesCliente.dart';
import '../../database/controllers/cliente_controller.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  //Future<List<Cliente>>? futureClientes;
  final controller = ClienteController();
  List<Cliente> lista = [];
  List<Cliente> displayLista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lista = controller.readAll();
      displayLista = lista;
      //futureClientes = controller.readAll();
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
          child: Column(
        children: [
          const TopBar(
            imagem: CustomImages.imagemClientes,
            titulo: CustomTitles.tituloClientes,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: largura * 0.92,
            height: altura * 0.12,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                      onChanged: (text) => filtrarResultados(text))),
            ),
          ),
          Container(
            height: altura * 0.57,
            width: largura * 0.92,
            decoration: CustomStyles.boxDecorationListas,
            child: Container(
                decoration: CustomStyles.decorationTile,
                child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 0.5, indent: 10, endIndent: 10,),
                    itemCount: displayLista.length,
                    itemBuilder: (context, index) {
                      if (displayLista.isEmpty) {
                        return const Center(child: Text("Sem clientes ..."));
                      } else {
                        int id = displayLista[index].id;
                        return ListTile(
                                    leading: CustomIcons.iconeClienteTile,
                                    title: Text(
                                        displayLista[index].nome.toString()),
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
                                    });
                      }
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
      )),
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
