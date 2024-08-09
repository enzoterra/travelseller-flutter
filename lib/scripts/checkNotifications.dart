import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/scripts/notifications_service.dart';
import 'package:travelseller/pages/principais/viagens.dart';
import 'package:travelseller/scripts/viagens.dart';
import 'package:workmanager/workmanager.dart';

class CheckNotifications {
  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      checkTripsAndNotify();
      markTaskAsCompleted(inputData?['taskName']);
      return Future.value(true);
    });
  }

  static Future checkTripsAndNotify() async {
    BuildContext context = viagensContextGlobal.currentContext!;
    int id = 0;
    List<Viagem> lista = ViagemController().readAll();
    if (lista.isNotEmpty) {
      for (Viagem viagem in lista) {
        var dataPreString = viagem.dataIda!.split("/");
        var dataPreDate =
            dataPreString[2] + dataPreString[1] + dataPreString[0];
        var data = DateTime.parse(dataPreDate);
        var hoje = DateTime.now();

        if (data.year == hoje.year && data.month == hoje.month) {
          if (data.day - hoje.day == 1) {
            var cliente = ClienteController().read(viagem.idCliente);
            String nome = ViagensScripts().encurtaNome(cliente.nome);
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
