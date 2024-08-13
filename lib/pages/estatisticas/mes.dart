import 'package:flutter/material.dart';
import 'package:travelseller/custom/images.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/components/tiles/lista_viagem_tile.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';
import 'package:travelseller/scripts/viagens.dart';

class MesPage extends StatefulWidget {
  const MesPage({super.key, required this.mes, required this.listaMes});

  final String mes;
  final List listaMes;

  @override
  State<MesPage> createState() => _MesPageState();
}

class _MesPageState extends State<MesPage> {
  @override
  Widget build(BuildContext context) {
    ClienteController clienteController = ClienteController();
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          InternTopbar(
            imagem: CustomImages.imagemInternEstatisticas,
            titulo: widget.mes,
            index: 0,
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: altura * 0.7,
                width: largura * 0.9,
                decoration: CustomStyles.boxDecorationListas,
                child: ListView.separated(
                    padding: const EdgeInsets.only(top: 10, bottom: 7),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 5,
                        ),
                    itemCount: widget.listaMes.length,
                    itemBuilder: (context, index) {
                      if (widget.listaMes.isEmpty) {
                        return const Center(child: Text("Sem clientes ..."));
                      } else {
                        Viagem viagem = widget.listaMes[index];
                        Cliente cliente =
                            clienteController.read(viagem.idCliente);

                        return ListTile(
                            title: ViagemListTile(
                                nome:
                                    ViagensScripts().encurtaNome(cliente.nome),
                                destino: viagem.cidade!,
                                embarque: viagem.dataVolta!,
                                desembarque: 'R\$ ${viagem.valorComissao.toString()}'),
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
                    }),
              ))
        ],
      ),
    );
  }
}
