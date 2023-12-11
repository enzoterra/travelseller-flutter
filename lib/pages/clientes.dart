import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Column(
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
                Row(
                  children: [
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
            child: Center(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: const [
                  Card(
                    child: ListTile(
                      leading: CustomIcons.iconeClienteTile,
                      title: Text('Enzo Andrade Terra'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
