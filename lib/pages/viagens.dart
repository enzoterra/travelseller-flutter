import 'package:flutter/material.dart';
import 'package:travelseller/components/topBar.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

class ViagensState extends State<Viagens> {
  static const String titulo = "Viagens\nProgramadas";
  static const String imagem = "assets/images/viagens_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBar(
          imagem: imagem,
          titulo: titulo,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text("Próximas Viagens",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.5))
              ]),
              Column(children: [
                Text("CONF",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ]),
            ],
          ),
        ),
        Container(
          height: 480,
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          child: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Color.fromARGB(255, 233, 233, 233)),
            ),
        ),
      ],
    );
  }
}

//bottomNavigationBar: BottomNavigation(indexPag: 1,),
/*
  appBar: PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: TopBar(
      imagem: imagem,
      titulo: titulo,
  )),
*/