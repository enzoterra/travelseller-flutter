import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/cadastro_cliente_tile.dart';
import 'package:travelseller/components/tiles/cadastro_informacoes_tile.dart';
import 'package:travelseller/components/tiles/cadastro_viagem_tile.dart';
import 'package:travelseller/components/tiles/cadastro_voo_tile.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    const double marginTiles = 70;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: altura * 0.18,
                width: largura * 1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(Images.imagemCadastro))),
                child: const Center(
                    child: Text(
                  Titles.tituloCadastro,
                  style: Styles.tituloCadastro,
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: altura * 0.7,
                    width: largura * 0.85,
                    child: Scrollbar(
                        child: ListView(
                      children: const [
                        CadastroClienteTile(),
                        SizedBox(
                          height: marginTiles,
                        ),
                        CadastroViagemTile(),
                        SizedBox(
                          height: marginTiles,
                        ),
                        CadastroVooTile(),
                        SizedBox(
                          height: marginTiles,
                        ),
                        CadastroInformacoesTile(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 70,
                  width: largura * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          "Salvar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                      )
                    ],
                  ))
            ]));
  }
}
