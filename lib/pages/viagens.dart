import 'package:flutter/material.dart';
import 'package:travelseller/components/top_bar.dart';

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
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const TopBar(
          imagem: imagem,
          titulo: titulo,
        ),
        Container(
          height: altura * 0.1,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text("Próximas Viagens",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.5))
              ]),
              Column(children: [
                Text("CONF",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ]),
            ],
          ),
        ),
        SizedBox(
          height: altura * 0.65,
          width: largura * 0.92,
          //padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 233, 233, 233)),
          ),
        ),
      ],
    );
  }
}
