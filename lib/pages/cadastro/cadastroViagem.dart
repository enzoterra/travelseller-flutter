import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/actionButtonsCadastro.dart';
import 'package:travelseller/components/tiles/dados/cliente_tile.dart';
import 'package:travelseller/components/tiles/dados/escolher_cliente_tile.dart';
import 'package:travelseller/components/tiles/dados/outras_informacoes_tile.dart';
import 'package:travelseller/components/tiles/dados/viagem_tile.dart';
import 'package:travelseller/components/tiles/dados/voo_tile.dart';
import 'package:travelseller/components/top_bar_interno.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import '../../database/controllers/cliente_controller.dart';

// ignore: must_be_immutable
class CadastroViagem extends StatefulWidget {
  const CadastroViagem(
      {super.key, required this.jaTemCliente, required this.cliente});

  final int jaTemCliente;
  final Cliente cliente;
  @override
  State<CadastroViagem> createState() => CadastroViagemState();
}

class CadastroViagemState extends State<CadastroViagem> {
  final clienteController = ClienteController();
  final viagemController = ViagemController();
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

  verificarCliente() {
    if (widget.jaTemCliente == 1) {
      nomeController.text = widget.cliente.nome;
      cpfController.text = widget.cliente.cpf;
      rgController.text = widget.cliente.rg;
      nascimentoController.text = widget.cliente.dataNascimento;
    }
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    verificarCliente();

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TopBarInterno(
            imagem: CustomImages.imagemCadastro,
            titulo: CustomTitles.tituloCadastro,
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
                          isCadastro: true,
                          viagem: Viagem(idCliente: -1),
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
                            functionDelete: () => {},
                            indexHome: 1,
                            isCadastro: true,
                            isViagem: true,
                            viagem: null,
                            cliente: widget.cliente),
                      ],
                    ),
                  ))),
        ],
      )),
    );
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

    if (widget.jaTemCliente == 1) {
      viagemController.create(
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
          comissao,
          widget.cliente.id);
    } else {
      int idCliente = clienteController.create(nomeController.text,
          cpfController.text, rgController.text, nascimentoController.text);

      viagemController.create(
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
          comissao,
          idCliente);
    }
  }
}
