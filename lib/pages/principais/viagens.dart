import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/dimens.dart';
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
import 'package:travelseller/notifications_service.dart';
import 'package:travelseller/pages/cadastro/cadastroViagem.dart';
import 'package:travelseller/pages/principais/configuracoes.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';
import 'package:workmanager/workmanager.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

void callbackDispatcher(BuildContext context) {
  Workmanager().executeTask((task, inputData) async {
    await checkTripsAndNotify(context);
    return Future.value(true);
  });
}

Future checkTripsAndNotify(BuildContext context) async {
  int id = 0;
  var lista = ViagemController().readAll();
  if (lista.isNotEmpty) {
    for (Viagem viagem in lista) {
      var dataPreString = viagem.dataIda!.split("/");
      var dataPreDate = dataPreString[2] + dataPreString[1] + dataPreString[0];
      var data = DateTime.parse(dataPreDate);
      var hoje = DateTime.now();

      if (data.year == hoje.year && data.month == hoje.month) {
        if (data.day - hoje.day == 1) {
          var cliente = ClienteController().read(viagem.idCliente);
          String nome = encurtaNome(cliente.nome);
          NotificationService().showNotification(
              CustomNotification(
                  id: id, title: nome, body: "Irá viajar daqui há 1 dia!"),
              context);

          id++;
        }
      }
    }
  }
}

String encurtaNome(String nome) {
  var nomeSplit = nome.split(" ");
  if (nomeSplit.first == nomeSplit.last) {
    nome = nomeSplit.first;
  } else {
    nome = nomeSplit.first + (" ") + nomeSplit.last;
  }
  return nome;
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

    // Initialize Workmanager
    Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask(
      "1",
      "checkTripsTask",
      frequency: Duration(days: 1),
      initialDelay: Duration(hours: 18, minutes: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TopBar(
            imagem: CustomImages.imagemViagens,
            titulo: CustomTitles.tituloViagens,
          ),
          Container(
            height: altura * 0.11,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(CustomTitles.subTituloViagens,
                        style: CustomStyles.subTituloPagina),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const Configuracoes())));
                        },
                        icon: CustomIcons.iconeConfiguracao),
                  ]),
            ),
          ),
          Container(
            height: altura * CustomDimens.heigthViagemList,
            width: largura * CustomDimens.widthLists,
            decoration: CustomStyles.boxDecorationListas,
            child: Container(
                decoration: CustomStyles.decorationTile,
                child: ListView.separated(
                    padding: const EdgeInsets.only(top: 10, bottom: 7),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          thickness: 0.5,
                          indent: 12,
                          endIndent: 12,
                        ),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      if (lista.isEmpty) {
                        return const Center(child: Text("Sem clientes ..."));
                      } else {
                        int id = lista[index].id;
                        Viagem viagem = viagemController.read(id);
                        Cliente cliente =
                            clienteController.read(viagem.idCliente);

                        return ListTile(
                            title: ViagemListTile(
                                nome: encurtaNome(cliente.nome),
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
    ));
  }
}
