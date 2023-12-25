import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/informacoes/informacoes_cliente_tile.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/home.dart';
import '../database/controllers/cliente_controller.dart';

class InformacoesCliente extends StatefulWidget {
  const InformacoesCliente({
    super.key,
    required this.cliente,
  });

  final Cliente cliente;

  @override
  State<InformacoesCliente> createState() => InformacoesClienteState();
}

class InformacoesClienteState extends State<InformacoesCliente> {
  final clienteController = ClienteController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController rgController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      nomeController.text = widget.cliente.nome;
      cpfController.text = widget.cliente.cpf!;
      rgController.text = widget.cliente.rg!;
      nascimentoController.text = widget.cliente.dataNascimento!;
    });
  }

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
                        image: AssetImage(CustomImages.imagemInformacoes))),
                child: Column(children: [
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  const Flexible(
                      flex: 5,
                      child: Center(
                          child: Text(
                        CustomTitles.tituloInformacoes,
                        style: CustomStyles.tituloCadastro,
                      )))
                ]),
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
                          nomeController: nomeController,
                          cpfController: cpfController,
                          rgController: rgController,
                          nascimentoController: nascimentoController,
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
                                        deletar(widget.cliente);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const Home(
                                                      currentIndex: 1,
                                                    ))));
                                      },
                                      child: const Text('Excluir'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColors.vermelhoExcluir),
                            ),
                            child: const Text(
                              "Excluir",
                              style: CustomStyles.textoBotoes,
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
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColors.verdeSalvar),
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

  salvar(Cliente cliente) {
    cliente.nome = nomeController.text;
    cliente.cpf = cpfController.text;
    cliente.rg = rgController.text;
    cliente.dataNascimento = nascimentoController.text;
    cliente.idViagem = cliente.idViagem;
    clienteController.update(cliente);
  }

  deletar(Cliente cliente) {
    int id = widget.cliente.idViagem!;
    ViagemController viagemController = ViagemController();
    Viagem viagem = viagemController.read(id);
    viagemController.delete(viagem);
    clienteController.delete(widget.cliente);
  }
}
