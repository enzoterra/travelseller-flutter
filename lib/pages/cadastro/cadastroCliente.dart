import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/actionButtonsCadastro.dart';
import 'package:travelseller/components/tiles/dados/cliente_tile.dart';
import 'package:travelseller/components/top_bar_interno.dart';
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
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const TopBarInterno(
            imagem: CustomImages.imagemCadastro,
            titulo: CustomTitles.tituloCadastro,
            index: 0,
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
                      ActionButtonsCadastro(
                          functionSave: salvar,
                          functionDelete: () => {},
                          indexHome: 0,
                          isCadastro: true,
                          isViagem: false,
                          viagem: null,
                          cliente: null)
                    ],
                  )))),
        ],
      ),
    );
  }

  salvar() {
    clienteController.create(nomeController.text, cpfController.text,
        rgController.text, nascimentoController.text);
  }
}
