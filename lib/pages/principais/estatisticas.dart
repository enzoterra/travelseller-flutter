import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  EstatisticasState createState() => EstatisticasState();
}

class EstatisticasState extends State<Estatisticas> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopBar(
        imagem: CustomImages.imagemEstatisticas,
        titulo: CustomTitles.tituloEstatisticas,
      ),
    );
  }
}
