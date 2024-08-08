import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/settings/dia_lembretes.dart';
import 'package:travelseller/components/tiles/settings/export_import.dart';
import 'package:travelseller/components/tiles/settings/ida_volta_lembrete.dart';
import 'package:travelseller/components/tiles/settings/small_space_tiles.dart';
import 'package:travelseller/components/tiles/settings/space_tiles.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/settings_controller.dart';
import 'package:travelseller/database/model/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SettingsController settingsController = SettingsController();
  List<Settings> settings = [];
  int id = 0;
  late bool ida, volta, umaHora, umDia, doisDias, limpar, passar;

  @override
  void initState() {
    super.initState();
    settings = settingsController.readAll();

    if (settings.isEmpty) {
      setState(() {
        Settings setting = Settings(
            ida: true,
            volta: true,
            umaHora: false,
            umDia: true,
            doisDias: true,
            limpar: false,
            passar: false);
        id = settingsController.create(setting);
        settings = settingsController.readAll();
      });
    } else {
      id = settings.first.id;
      ida = settings.first.ida;
      volta = settings.first.volta;
      umaHora = settings.first.umaHora;
      umDia = settings.first.umDia;
      doisDias = settings.first.doisDias;
      limpar = settings.first.limpar;
      passar = settings.first.passar;
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Função que executa quando sair da página
    salvar(id);
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children: [
        const InternTopbar(
          imagem: CustomImages.imagemConfiguracoes,
          titulo: CustomTitles.tituloConfiguracoes,
          index: 1,
        ),
        SizedBox(
            width: largura * CustomDimens.widthListTiles,
            height: altura * 0.75,
            child: Scrollbar(
                child: ListView(children: [
              const SizedBox(
                height: 20,
              ),

              //Tiles Lembretes para ida e volta
              IdaVoltaLembrete(ida: ida, volta: volta),
              const SpaceTiles(),

              //Tiles Dias para lembretes
              DiaLembretes(umDia: umDia, doisDias: doisDias),
              const SpaceTiles(),

              //Tiles Export
              const ExportImportSettings(),
              const SmallSpaceTiles()
            ])))
      ]),
    );
  }

  salvar(int id) {
    Settings configuracao = Settings(
        ida: ida,
        volta: volta,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);
    configuracao.id = id;
    settingsController.update(configuracao);
  }
}
