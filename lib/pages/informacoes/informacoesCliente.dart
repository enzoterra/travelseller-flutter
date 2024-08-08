import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/buttons/actionButtonsCadastro.dart';
import 'package:travelseller/components/tiles/dados/cliente_tile.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import '../../database/controllers/cliente_controller.dart';

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
      cpfController.text = widget.cliente.cpf;
      rgController.text = widget.cliente.rg;
      nascimentoController.text = widget.cliente.dataNascimento;
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const InternTopbar(
              imagem: CustomImages.imagemInformacoes,
              titulo: CustomTitles.tituloInformacoes,
              index: 0,
            ),
            SizedBox(
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
                      functionDelete: deletar,
                      indexHome: 0,
                      isCadastro: false,
                      isViagem: false,
                      viagem: null,
                      cliente: widget.cliente)
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  salvar(Cliente cliente) {
    cliente.nome = nomeController.text;
    cliente.cpf = cpfController.text;
    cliente.rg = rgController.text;
    cliente.dataNascimento = nascimentoController.text;
    clienteController.update(cliente);
  }

  deletar(Cliente cliente) {
    ViagemController viagemController = ViagemController();
    Viagem viagem = viagemController.readByCliente(cliente.id);
    if (viagem.idCliente >= 0) {
      viagemController.delete(viagem);
    }
    clienteController.delete(widget.cliente);
  }
}
