import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String imagem;
  final String titulo;

  const TopBar({super.key, required this.imagem, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return SizedBox(
      height: altura * 0.16,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagem), fit: BoxFit.cover)),
          child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(titulo,
                  style: const TextStyle(
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(120, 0, 0, 0),
                            offset: Offset(0, 0),
                            blurRadius: 0)
                      ],
                      color: Colors.white,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1)))),
    );
  }
}

/*
return AppBar(
      flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagem), fit: BoxFit.cover))),
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      elevation: 0,
    );
*/