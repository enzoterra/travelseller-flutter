import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/actionButtonsCadastro.dart';
//import 'package:travelseller/components/tiles/actionButtonsCadastro.dart';
import 'package:travelseller/components/tiles/dados/cliente_tile.dart';
import 'package:travelseller/components/tiles/dados/outras_informacoes_tile.dart';
import 'package:travelseller/components/tiles/dados/viagem_tile.dart';
import 'package:travelseller/components/tiles/dados/voo_tile.dart';
import 'package:travelseller/components/top_bar_interno.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import '../../components/custom/dimens.dart';
import '../../components/tiles/dados/escolher_cliente_tile.dart';
import '../../database/controllers/cliente_controller.dart';

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
      cpfController.text = widget.cliente.cpf;
      rgController.text = widget.cliente.rg;
      nascimentoController.text = widget.cliente.dataNascimento;
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBarInterno(
              imagem: CustomImages.imagemInformacoes,
              titulo: CustomTitles.tituloInformacoes,
              index: 1,
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: altura * CustomDimens.heightListTiles,
                    width: largura * CustomDimens.widthListTiles,
                    child: Scrollbar(
                        child: ListView(
                      children: [
                        ClienteTile(
                          nomeController: nomeController,
                          cpfController: cpfController,
                          rgController: rgController,
                          nascimentoController: nascimentoController,
                        ),
                        const SizedBox(
                          height: CustomDimens.marginTiles,
                        ),
                        EscolherClienteTile(
                          isCadastro: false,
                          viagem: widget.viagem,
                        ),
                        const Divider(
                          height: CustomDimens.heightDivider,
                        ),
                        ViagemTile(
                          hotelController: hotelController,
                          cidadeController: cidadeController,
                        ),
                        const Divider(
                          height: CustomDimens.heightDivider,
                        ),
                        VooTile(
                          localizadorController: localizadorController,
                          companhiaController: companhiaController,
                          codigoController: codigoController,
                          dataIdaController: dataIdaController,
                          horaIdaController: horaIdaController,
                          dataVoltaController: dataVoltaController,
                          horaVoltaController: horaVoltaController,
                        ),
                        const Divider(
                          height: CustomDimens.heightDivider,
                        ),
                        OutrasInformacoesTile(
                          valorVendaController: valorVendaController,
                          comissaoController: comissaoController,
                          observacoesController: observacoesController,
                        ),
                        const SizedBox(
                          height: CustomDimens.marginTilesSmall,
                        ),
                        ActionButtonsCadastro(
                            functionSave: salvar,
                            functionDelete: deletar,
                            indexHome: 1,
                            isCadastro: false,
                            isViagem: true,
                            viagem: widget.viagem,
                            cliente: widget.cliente)
                      ],
                    )))),
          ],
        ),
      ),
    );
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

    cliente.nome = nomeController.text;
    cliente.cpf = cpfController.text;
    cliente.rg = rgController.text;
    cliente.dataNascimento = nascimentoController.text;

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
    viagem.idCliente = cliente.id;

    clienteController.update(cliente);
    viagemController.update(viagem);
  }

  deletar(Viagem viagem) {
    viagemController.delete(widget.viagem);
  }
}
