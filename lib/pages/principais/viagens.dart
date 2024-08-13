import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/images.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/custom/titles.dart';
import 'package:travelseller/components/topbar/top_bar.dart';
import 'package:travelseller/components/tiles/lista_viagem_tile.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/cadastro/cadastroViagem.dart';
import 'package:travelseller/pages/principais/settings.dart';
import 'package:travelseller/pages/informacoes/informacoesViagem.dart';
import 'package:travelseller/scripts/checkNotifications.dart';
import 'package:travelseller/scripts/viagens.dart';
import 'package:workmanager/workmanager.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

GlobalKey<NavigatorState> viagensContextGlobal = GlobalKey<NavigatorState>();

class ViagensState extends State<Viagens> {
  final viagemController = ViagemController();
  final clienteController = ClienteController();
  List<Viagem> lista = [];

  @override
  void initState() {
    super.initState();

    String taskName = "checkTripsTask";

    // Chama função assíncrona
    Future.delayed(Duration.zero, () {
      isTaskPending(taskName).then((isPending) {
        // Agendar a tarefa, pois ainda não foi agendada ou já foi cumprida
        print(isPending);
        if (!isPending) {
          // Initialize Workmanager
          Workmanager().registerPeriodicTask("1", taskName,
              frequency: const Duration(days: 1),
              initialDelay:
                  Duration.zero, //CheckNotifications().calculateInitialDelay(),
              inputData: {'taskName': taskName});

          // Salvar o status da tarefa como pendente
          CheckNotifications.saveTaskStatus(taskName);
        }
      });
    });

    setState(() {
      lista = viagemController.readAll();

      // Filtrar viagens que não foram feitas
      List<Viagem> secondList = [];
      for (Viagem viagem in lista) {
        var today = DateTime.now();
        var dataPreString = viagem.dataVolta!.split("/");
        var dataPreDate =
            dataPreString[2] + dataPreString[1] + dataPreString[0];
        DateTime data = DateTime.parse(dataPreDate);
        if (today.isBefore(data)) {
          secondList.add(viagem);
        }
      }
      lista = secondList;
    });
  }

  Future<bool> isTaskPending(String taskName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(taskName) ?? false;
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
                            onPressed: () async {
                              goToSettings();
                            },
                            icon: CustomIcons.iconeConfiguracao),
                      ]),
                ),
              ),
              Container(
                height: altura * CustomDimens.heigthViagemList,
                width: largura * CustomDimens.widthLists,
                decoration: CustomStyles.boxDecorationListas,
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

  goToSettings() async {
    final isSettings = await Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const SettingsPage())));
    if (isSettings!) {
      setState(() {});
    }
  }
}
