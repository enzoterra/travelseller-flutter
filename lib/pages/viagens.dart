import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/components/tiles/viagem_tile.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/informacoes.dart';
import '../database/object_box.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

class ViagensState extends State<Viagens> {
  //Future<List<Viagem>>? futureViagens;
  final controller = ViagemController();
  List<Viagem> lista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      //futureViagens = controller.readAll();
      lista = controller.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const TopBar(
          imagem: Images.imagemViagens,
          titulo: Titles.tituloViagens,
        ),
        Container(
          height: altura * 0.11,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(Titles.subTituloViagens, style: Styles.subTituloPagina)
                ]),
                Column(children: [
                  Text("CONF",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ]),
              ],
            ),
          ),
        ),
        SizedBox(
          height: altura * 0.62,
          width: largura * 0.92,
          child: Container(
              decoration: Styles.decorationTile,
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return lista.isEmpty
                        ? const Center(child: Text("Sem clientes ..."))
                        : ListTile(
                            title: const ViagemListTile(
                                nome: "Enzo Terra",
                                destino: "Natal/RN",
                                embarque: "21/10/2024",
                                desembarque: "30/10/2024"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          Informacoes(id: index))));
                            },
                          );
                  })

              /*FutureBuilder<List<Viagem>>(
                future: futureViagens,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final listaViagens = snapshot.data!;

                    return listaViagens.isEmpty
                        ? const Center(child: Text("Sem viagens marcadas ..."))
                        : ListView.builder(
                            padding: const EdgeInsets.all(7),
                            itemCount: listaViagens.length,
                            itemBuilder: (context, index) {
                              //final cliente = listaViagens[index];
                              return Center(
                                  child: ListView(
                                padding: const EdgeInsets.all(10),
                                children: const [
                                  ViagemListTile(
                                      nome: "Enzo Terra",
                                      destino: "Natal/RN",
                                      embarque: "21/10/2024",
                                      desembarque: "30/10/2024"),
                                ],
                              ));
                            });
                  }
                },
              )*/
              ),
        ),
      ],
    );
  }
}
