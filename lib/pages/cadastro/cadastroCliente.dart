import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/dados/cliente_tile.dart';
import 'package:travelseller/components/top_bar_interno.dart';
import 'package:travelseller/pages/principais/home.dart';
import '../../database/controllers/cliente_controller.dart';

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({super.key});

  @override
  State<CadastroCliente> createState() => CadastroClienteState();
}

class CadastroClienteState extends State<CadastroCliente> {
  final clienteController = ClienteController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController rgController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    rgController.dispose();
    nascimentoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBarInterno(
                  imagem: CustomImages.imagemCadastro,
                  titulo: CustomTitles.tituloCadastro),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 330,
                  width: largura * 0.85,
                  child: ClienteTile(
                    nomeController: nomeController,
                    cpfController: cpfController,
                    rgController: rgController,
                    nascimentoController: nascimentoController,
                  ),
                ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Home(
                                            currentIndex: 0,
                                          ))));
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey),
                            ),
                            child: const Text(
                              "Cancelar",
                              style: CustomStyles.textoPretoBotoes,
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
                              style: CustomStyles.textoBotoes,
                            ),
                          ))
                    ],
                  ))
            ]));
  }

  salvar() {
    clienteController.create(nomeController.text, cpfController.text,
        rgController.text, nascimentoController.text);
  }
}
