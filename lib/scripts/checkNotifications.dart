import 'package:flutter/material.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/notifications_service.dart';
import 'package:travelseller/scripts/viagens.dart';
import 'package:workmanager/workmanager.dart';

class CheckNotifications {
  static void callbackDispatcher(BuildContext context) {
    Workmanager().executeTask((task, inputData) {
      checkTripsAndNotify(context);
      return Future.value(true);
    });
  }

  static Future checkTripsAndNotify(BuildContext context) async {
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
}
