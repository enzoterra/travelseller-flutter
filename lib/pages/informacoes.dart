import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/cadastro_cliente_tile.dart';
import 'package:travelseller/components/tiles/cadastro_informacoes_tile.dart';
import 'package:travelseller/components/tiles/cadastro_viagem_tile.dart';
import 'package:travelseller/components/tiles/cadastro_voo_tile.dart';
import 'package:travelseller/components/tiles/informacoes_salvas_tile%20.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/home.dart';

import '../database/controllers/cliente_controller.dart';
import '../database/object_box.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({super.key, required this.id});

  final int id;

  @override
  State<Informacoes> createState() => InformacoesState();
}

class InformacoesState extends State<Informacoes> {
  final viagemController = ViagemController();
  final clienteController = ClienteController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController rgController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  final TextEditingController hotelController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController localizadorController = TextEditingController();
  final TextEditingController companhiaController = TextEditingController();
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController dataIdaController = TextEditingController();
  final TextEditingController horaIdaController = TextEditingController();
  final TextEditingController dataVoltaController = TextEditingController();
  final TextEditingController horaVoltaController = TextEditingController();
  final TextEditingController valorVendaController = TextEditingController();
  final TextEditingController comissaoController = TextEditingController();
  final TextEditingController observacoesController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Viagem viagem = viagemController.read(widget.id);
    final altura = MediaQuery.of(context).size.height;
    const double marginTiles = 70;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: altura * 0.2,
                width: largura * 1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(Images.imagemInformacoes))),
                child: const Center(
                    child: Text(
                  Titles.tituloInformacoes,
                  style: Styles.tituloCadastro,
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: altura * 0.69,
                    width: largura * 0.85,
                    child: Scrollbar(
                        child: ListView(
                      children: [
                        CadastroClienteTile(
                          nomeController: nomeController,
                          cpfController: cpfController,
                          rgController: rgController,
                          nascimentoController: nascimentoController,
                        ),
                        const SizedBox(
                          height: marginTiles,
                        ),
                        CadastroViagemTile(
                          hotelController: hotelController,
                          cidadeController: cidadeController,
                        ),
                        const SizedBox(
                          height: marginTiles,
                        ),
                        CadastroVooTile(
                          localizadorController: localizadorController,
                          companhiaController: companhiaController,
                          codigoController: codigoController,
                          dataIdaController: dataIdaController,
                          horaIdaController: horaIdaController,
                          dataVoltaController: dataVoltaController,
                          horaVoltaController: horaVoltaController,
                        ),
                        const SizedBox(
                          height: marginTiles,
                        ),
                        InformacoesSalvasTile(
                          valorVendaController: valorVendaController,
                          comissaoController: comissaoController,
                          observacoesController: observacoesController,
                        ),
                        const SizedBox(
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
                  width: largura * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 106,
                          child: TextButton(
                            onPressed: () {
                              AlertDialog(
                                title: const Text('Deseja excluir?'),
                                content: const Text(
                                    'Isso excluirá os dados da viagem, mas manterá os dados do cliente'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancelar'),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      viagemController.delete(viagem);

                                      MaterialPageRoute(
                                          builder: ((context) => const Home(
                                                currentIndex: 1,
                                              )));
                                    },
                                    child: const Text('Excluir'),
                                  ),
                                ],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Home(
                                            currentIndex: 1,
                                          ))));
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red),
                            ),
                            child: const Text(
                              "Excluir",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2),
                            ),
                          )),
                      SizedBox(
                          height: 40,
                          width: 106,
                          child: TextButton(
                            onPressed: () {
                              salvar();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Home(
                                            currentIndex: 1,
                                          ))));
                            },
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
                                  letterSpacing: 1.2),
                            ),
                          ))
                    ],
                  ))
            ]));
  }

  salvar() {
    double valorVenda = 0;
    double comissao = 0;
    if (valorVendaController.text != "") {
      double.parse(valorVendaController.text);
    }

    if (comissaoController.text != "") {
      double.parse(comissaoController.text);
    }

    int idViagem = viagemController.create(
        codigoController.text,
        localizadorController.text,
        companhiaController.text,
        cidadeController.text,
        hotelController.text,
        dataIdaController.text,
        horaIdaController.text,
        dataVoltaController.text,
        horaVoltaController.text,
        observacoesController.text,
        valorVenda,
        comissao);

    clienteController.create(nomeController.text, cpfController.text,
        rgController.text, nascimentoController.text, idViagem);
  }
}
