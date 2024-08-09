import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/settings_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/settings.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/scripts/notifications_service.dart';
import 'package:travelseller/pages/principais/viagens.dart';
import 'package:travelseller/scripts/viagens.dart';
import 'package:workmanager/workmanager.dart';

class CheckNotifications {
  @pragma('vm:entry-point')
  static callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      print("ta bom, ta indo!!!!!");
      checkTripsAndNotify();
      markTaskAsCompleted(inputData?['taskName']);
      return Future.value(true);
    });
  }

  static Future checkTripsAndNotify() async {
    BuildContext context = viagensContextGlobal.currentContext!;
    List<Viagem> lista = ViagemController().readAll();
    Settings settings = SettingsController().read(0);
    int id = 0;
    if (lista.isNotEmpty) {
      for (Viagem viagem in lista) {
        sendDayNotification(viagem, id, settings, context);
        id += 4;
      }
    }
  }

  static sendDayNotification(
      Viagem viagem, int id, Settings settings, BuildContext context) {
    if (settings.ida) {
      var dataPreString = viagem.dataIda!.split("/");
      var dataPreDate = dataPreString[2] + dataPreString[1] + dataPreString[0];
      var data = DateTime.parse(dataPreDate);
      var hoje = DateTime.now();

      final difference = data.difference(hoje);

      if (settings.umDia) {
        if (difference.inDays == 1) {
          var cliente = ClienteController().read(viagem.idCliente);
          String nome = ViagensScripts().encurtaNome(cliente.nome);
          NotificationService().showNotification(
              CustomNotification(
                  id: id, title: nome, body: "Irá viajar daqui há 1 dia!"),
              context);
          id++;
        }
        if (settings.doisDias) {
          if (difference.inDays == 2) {
            var cliente = ClienteController().read(viagem.idCliente);
            String nome = ViagensScripts().encurtaNome(cliente.nome);
            NotificationService().showNotification(
                CustomNotification(
                    id: id, title: nome, body: "Irá viajar daqui há 2 dias!"),
                context);
            id++;
          }
        }
      }
    }

    if (settings.volta) {
      var dataPreString = viagem.dataVolta!.split("/");
      var dataPreDate = dataPreString[2] + dataPreString[1] + dataPreString[0];
      var data = DateTime.parse(dataPreDate);
      var hoje = DateTime.now();

      final difference = data.difference(hoje);

      if (settings.umDia) {
        if (difference.inDays == 1) {
          var cliente = ClienteController().read(viagem.idCliente);
          String nome = ViagensScripts().encurtaNome(cliente.nome);
          NotificationService().showNotification(
              CustomNotification(
                  id: id, title: nome, body: "Irá voltar daqui há 1 dia!"),
              context);
          id++;
        }
        if (settings.doisDias) {
          if (difference.inDays == 2) {
            var cliente = ClienteController().read(viagem.idCliente);
            String nome = ViagensScripts().encurtaNome(cliente.nome);
            NotificationService().showNotification(
                CustomNotification(
                    id: id, title: nome, body: "Irá voltar daqui há 2 dias!"),
                context);
            id++;
          }
        }
      }
    }
  }

  Duration calculateInitialDelay() {
    final now = DateTime.now();
    final targetTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    if (now.isAfter(targetTime)) {
      // Se já passou das 8h hoje, agenda para amanhã
      targetTime.add(const Duration(days: 1));
    }
    return targetTime.difference(now);
  }

  static void saveTaskStatus(String taskName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(taskName, true); // A tarefa foi agendada
  }

  Future<bool> isTaskPending(String taskName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(taskName) ?? false;
  }

  static void markTaskAsCompleted(String taskName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(taskName, false); // A tarefa foi cumprida
  }
}
