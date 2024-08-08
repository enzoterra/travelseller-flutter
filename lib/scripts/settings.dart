import 'dart:io';
import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/settings_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/settings.dart';
import 'package:travelseller/database/model/viagem.dart';

class SettingsScripts {
  exportar() {
    getDir().then((dir) async {
      dir = "$dir/TravelSeller";
      String viagens = 'viagens';
      String clientes = 'clientes';
      String settings = 'settings';

      final folderPath = Directory(dir);
      if (await folderPath.exists() == false) {
        await folderPath.create(recursive: true);
      }

      exportarDados(dir, viagens);
      exportarDados(dir, clientes);
      exportarDados(dir, settings);
    });
  }

  importar(BuildContext context) {
    getDir().then((dir) async {
      dir = "$dir/TravelSeller";
      String viagens = 'viagens';
      String clientes = 'clientes';
      String settings = 'settings';

      try {
        final dataViagens = await getFile(dir, viagens, context);
        List<List<dynamic>> csvViagens =
            const CsvToListConverter().convert(dataViagens);
        importarDados(viagens, csvViagens);

        final dataClientes = await getFile(dir, clientes, context);
        List<List<dynamic>> csvClientes =
            const CsvToListConverter().convert(dataClientes);
        importarDados(clientes, csvClientes);

        final dataConfiguracao = await getFile(dir, settings, context);
        List<List<dynamic>> csvConfiguracao =
            const CsvToListConverter().convert(dataConfiguracao);
        importarDados(settings, csvConfiguracao);
      } catch (error) {
        createSnackBar("Erro na importação - $error", context);
      }
    });
  }

  importarDados(String origem, List<List<dynamic>> lista) {
    if (lista.isNotEmpty) {
      if (origem == 'viagens') {
        for (var v in lista) {
          ViagemController().create(
            v[1].toString(),
            v[2].toString(),
            v[3].toString(),
            v[4].toString(),
            v[5].toString(),
            v[6].toString(),
            v[7].toString(),
            v[8].toString(),
            v[9].toString(),
            v[10].toString(),
            double.parse(v[11].toString()),
            double.parse(v[12].toString()),
            int.parse(v[13].toString()),
          );
        }
      } else if (origem == 'clientes') {
        for (var v in lista) {
          ClienteController().create(v[1].toString(), v[2].toString(),
              v[3].toString(), v[4].toString());
        }
      } else if (origem == 'settings') {
        for (var v in lista) {
          Settings configuracao = Settings(
              ida: bool.parse(v[1]),
              volta: bool.parse(v[2]),
              umaHora: bool.parse(v[3]),
              umDia: bool.parse(v[4]),
              doisDias: bool.parse(v[5]),
              limpar: bool.parse(v[6]),
              passar: bool.parse(v[7]));
          configuracao.id = 0;
          SettingsController().update(configuracao);
        }
      }
    }
  }

  exportarDados(String dir, String fileName) {
    List<List<dynamic>> lista = [];
    if (fileName == 'viagens') {
      List<Viagem> viagens = ViagemController().readAll();
      for (Viagem v in viagens) {
        lista.add([
          v.id,
          v.codigoVenda,
          v.localizador,
          v.companhiaAerea,
          v.cidade,
          v.hotel,
          v.dataIda,
          v.horaIda,
          v.dataVolta,
          v.horaVolta,
          v.observacoes,
          v.valorTotal,
          v.valorComissao,
          v.idCliente
        ]);
      }
    } else if (fileName == 'clientes') {
      List<Cliente> clientes = ClienteController().readAll();
      for (Cliente c in clientes) {
        lista.add([
          c.id,
          c.nome,
          c.cpf,
          c.rg,
          c.dataNascimento,
        ]);
      }
    } else if (fileName == 'settings') {
      List<Settings> configuracao = SettingsController().readAll();
      for (Settings c in configuracao) {
        lista.add([
          c.id,
          c.ida,
          c.volta,
          c.umaHora,
          c.umDia,
          c.doisDias,
          c.limpar,
          c.passar,
        ]);
      }
    }
    createCsv(lista, dir, fileName);
  }

  Future<String> getDir() {
    Future<String> dir = ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS);
    return dir;
  }

  getFile(String dir, String document, BuildContext context) async {
    var path = "$dir/$document.csv";

    if (FileSystemEntity.typeSync(path) != FileSystemEntityType.notFound) {
      try {
        final file = File(path);
        final data = await file.readAsString();
        return data;
      } catch (error) {
        createSnackBar('Erro na importação', context);
      }
    } else {
      createSnackBar('Sem arquivos para importar', context);
    }
  }

  createCsv(List<List<dynamic>> lista, String dir, String fileName) {
    String csv = const ListToCsvConverter().convert(lista);
    File file = File("$dir/$fileName.csv");
    file.writeAsString(csv);
  }

  createSnackBar(String text, BuildContext context) {
    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
