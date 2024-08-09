import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/tiles/lista_viagem_tile.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';
import 'package:travelseller/scripts/viagens.dart';

class MesPage extends StatefulWidget {
  const MesPage({super.key, required this.mes});

  final String mes;

  @override
  State<MesPage> createState() => _MesPageState();
}

class _MesPageState extends State<MesPage> {
  List<Viagem> viagens = [];
  List<Viagem> lista = [];

  @override
  void initState() {
    super.initState();

    viagens = ViagemController().readAll();
    for (Viagem viagem in viagens) {
      var mes = viagem.dataIda!.split("/")[1];
      if (mes == widget.mes) {
        lista.add(viagem);
      }
    }

    setState(() {
      viagens = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    ViagemController viagemController = ViagemController();
    ClienteController clienteController = ClienteController();
    final altura = MediaQuery.of(context).size.height;
    //final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          InternTopbar(
            imagem: CustomImages.imagemInternEstatisticas,
            titulo: widget.mes,
            index: 0,
          ),
          Container(
              height: altura * .7,
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: CustomStyles.boxDecorationListas,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 5,
                        ),
                    itemCount: viagens.length,
                    itemBuilder: (context, index) {
                      if (viagens.isEmpty) {
                        return const Center(child: Text("Sem clientes ..."));
                      } else {
                        int id = viagens[index].id;
                        Viagem viagem = viagemController.read(id);
                        Cliente cliente =
                            clienteController.read(viagem.idCliente);

                        return ListTile(
                            title: ViagemListTile(
                                nome:
                                    ViagensScripts().encurtaNome(cliente.nome),
                                destino: viagem.cidade!,
                                embarque: viagem.dataIda!,
                                desembarque: viagem.dataVolta!),
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
