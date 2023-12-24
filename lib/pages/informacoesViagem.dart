import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/cadastro/cadastro_viagem_tile.dart';
import 'package:travelseller/components/tiles/cadastro/cadastro_voo_tile.dart';
import 'package:travelseller/components/tiles/informacoes/informacoes_cliente_tile.dart';
import 'package:travelseller/components/tiles/informacoes/informacoes_salvas_tile%20.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/home.dart';
import '../database/controllers/cliente_controller.dart';

class InformacoesViagem extends StatefulWidget {
  const InformacoesViagem(
      {super.key, required this.viagem, required this.cliente});

  final Viagem viagem;
  final Cliente cliente;

  @override
  State<InformacoesViagem> createState() => InformacoesViagemState();
}

class InformacoesViagemState extends State<InformacoesViagem> {
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
  void initState() {
    super.initState();

    setState(() {
      nomeController.text = widget.cliente.nome;
      cpfController.text = widget.cliente.cpf!;
      rgController.text = widget.cliente.rg!;
      nascimentoController.text = widget.cliente.dataNascimento!;
      hotelController.text = widget.viagem.hotel!;
      cidadeController.text = widget.viagem.cidade!;
      localizadorController.text = widget.viagem.localizador!;
      companhiaController.text = widget.viagem.companhiaAerea!;
      codigoController.text = widget.viagem.codigoVenda!;
      dataIdaController.text = widget.viagem.dataIda!;
      horaIdaController.text = widget.viagem.horaIda!;
      dataVoltaController.text = widget.viagem.dataVolta!;
      horaVoltaController.text = widget.viagem.horaVolta!;
      valorVendaController.text = widget.viagem.valorTotal.toString();
      comissaoController.text = widget.viagem.valorComissao.toString();
      observacoesController.text = widget.viagem.observacoes!;
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    rgController.dispose();
    nascimentoController.dispose();
    hotelController.dispose();
    cidadeController.dispose();
    localizadorController.dispose();
    companhiaController.dispose();
    codigoController.dispose();
    dataIdaController.dispose();
    horaIdaController.dispose();
    dataVoltaController.dispose();
    horaVoltaController.dispose();
    valorVendaController.dispose();
    comissaoController.dispose();
    observacoesController.dispose();

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
                        image: AssetImage(Images.imagemInformacoes))),
                child: Column(children: [
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  const Flexible(
                      flex: 6,
                      child: Center(
                          child: Text(
                        Titles.tituloInformacoes,
                        style: Styles.tituloCadastro,
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
                                        deletar(widget.viagem);

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
                              salvar(widget.viagem, widget.cliente);

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

  salvar(Viagem viagem, Cliente cliente) {
    double valorVenda = 0;
    double comissao = 0;
    if (valorVendaController.text != "") {
      double.parse(valorVendaController.text);
    }

    if (comissaoController.text != "") {
      double.parse(comissaoController.text);
    }

    viagem.codigoVenda = codigoController.text;
    viagem.localizador = localizadorController.text;
    viagem.companhiaAerea = companhiaController.text;
    viagem.cidade = cidadeController.text;
    viagem.hotel = hotelController.text;
    viagem.dataIda = dataIdaController.text;
    viagem.horaIda = horaIdaController.text;
    viagem.dataVolta = dataVoltaController.text;
    viagem.horaVolta = horaVoltaController.text;
    viagem.observacoes = observacoesController.text;
    viagem.valorTotal = valorVenda;
    viagem.valorComissao = comissao;
    int idViagem = viagemController.update(viagem);

    cliente.nome = nomeController.text;
    cliente.cpf = cpfController.text;
    cliente.rg = rgController.text;
    cliente.dataNascimento = nascimentoController.text;
    cliente.idViagem = idViagem;

    clienteController.update(cliente);
  }

  deletar(Viagem viagem) {
    List<Cliente> lista = clienteController.readAllByViagem(widget.viagem.id);
    for (var cliente in lista) {
      cliente.idViagem = null;
      clienteController.update(cliente);
    }
    viagemController.delete(widget.viagem);
  }
}
