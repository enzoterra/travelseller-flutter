import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/informacoes/informacoes_cliente_tile.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/pages/home.dart';
import '../database/controllers/cliente_controller.dart';

class InformacoesCliente extends StatefulWidget {
  const InformacoesCliente({
    super.key,
    required this.cliente,
    required this.nomeController,
    required this.cpfController,
    required this.rgController,
    required this.nascimentoController,
  });

  final Cliente cliente;
  final TextEditingController nomeController;
  final TextEditingController cpfController;
  final TextEditingController rgController;
  final TextEditingController nascimentoController;
  /*@override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    rgController.dispose();
    nascimentoController.dispose();
    super.dispose();
  }*/

  @override
  State<InformacoesCliente> createState() => InformacoesClienteState();
}

class InformacoesClienteState extends State<InformacoesCliente> {
  final clienteController = ClienteController();

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    const double marginTiles = 70;

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
                        InformacoesClienteTile(
                          nomeController: widget.nomeController,
                          cpfController: widget.cpfController,
                          rgController: widget.rgController,
                          nascimentoController: widget.nascimentoController,
                          cliente: widget.cliente,
                        ),
                        const SizedBox(
                          height: marginTiles,
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
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
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
                                        clienteController
                                            .delete(widget.cliente);

                                        MaterialPageRoute(
                                            builder: ((context) => const Home(
                                                  currentIndex: 1,
                                                )));
                                      },
                                      child: const Text('Excluir'),
                                    ),
                                  ],
                                ),
                              );
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
                              salvar(widget.cliente);

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

  salvar(Cliente cliente) {
    cliente.nome = widget.nomeController.text;
    cliente.cpf = widget.cpfController.text;
    cliente.rg = widget.rgController.text;
    cliente.dataNascimento = widget.nascimentoController.text;
    cliente.idViagem = cliente.idViagem;
    clienteController.update(cliente);
  }
}
