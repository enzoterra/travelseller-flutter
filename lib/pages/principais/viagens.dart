import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar.dart';
import 'package:travelseller/components/tiles/lista_viagem_tile.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/cadastro/cadastroViagem.dart';
import 'package:travelseller/pages/principais/configuracoes.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

class ViagensState extends State<Viagens> {
  final viagemController = ViagemController();
  final clienteController = ClienteController();
  List<Viagem> lista = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lista = viagemController.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TopBar(
            imagem: CustomImages.imagemViagens,
            titulo: CustomTitles.tituloViagens,
          ),
          Container(
            height: altura * 0.11,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(CustomTitles.subTituloViagens,
                        style: CustomStyles.subTituloPagina),
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Configuracoes()))),
                        icon: CustomIcons.iconeConfiguracao),
                  ]),
            ),
          ),
          SizedBox(
            height: altura * 0.62,
            width: largura * 0.92,
            child: Container(
                decoration: CustomStyles.decorationTile,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      if (lista.isEmpty) {
                        return const Center(child: Text("Sem clientes ..."));
                      } else {
                        int id = lista[index].id;
                        Viagem viagem = viagemController.read(id);
                        Cliente cliente =
                            clienteController.read(viagem.idCliente);
                        String nome = cliente.nome;
                        String destino = viagem.cidade!;
                        String embarque = viagem.dataIda!;
                        String desembarque = viagem.dataVolta!;

                        return ListTile(
                            title: ViagemListTile(
                                nome: nome,
                                destino: destino,
                                embarque: embarque,
                                desembarque: desembarque),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => InformacoesViagem(
                                            viagem: viagem,
                                            cliente: cliente,
                                          ))));
                            });
                      }
                    })),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => CadastroViagem(
                        jaTemCliente: 0,
                        cliente: Cliente(
                            nome: "", cpf: "", rg: "", dataNascimento: ""),
                      ))));
        },
        backgroundColor: CustomColors.azulBotaoViagens,
        child: const Icon(Icons.add),
      ),
    );
  }
}
