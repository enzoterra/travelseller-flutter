import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/styles.dart';

// ignore: must_be_immutable
class IdaVoltaLembrete extends StatefulWidget {
  IdaVoltaLembrete({super.key, required this.ida, required this.volta});

  bool ida;
  bool volta;

  @override
  IdaVoltaLembreteState createState() => IdaVoltaLembreteState();
}

class IdaVoltaLembreteState extends State<IdaVoltaLembrete> {
  double espaco = 20;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Deseja receber lembretes de\nIda e Volta dos clientes?",
              style: CustomStyles.topicoConfiguracoes,
            ),
            SizedBox(
              height: espaco,
            ),
            ListTile(
              selected: widget.ida,
              onTap: () {
                setState(() {
                  widget.ida = !widget.ida;
                });
              },
              iconColor: CustomColors.stateVerdePreto,
              textColor: CustomColors.stateVerdePreto,
              leading: CustomIcons.configuracaoIda,
              title: const Text('Lembrete de Ida'),
              trailing: Switch(
                onChanged: (bool? value) {
                  setState(() {
                    widget.ida = value!;
                  });
                },
                value: widget.ida,
                activeColor: CustomColors.verdeEscuro,
              ),
            ),
            SizedBox(
              height: espaco,
            ),
            ListTile(
              selected: widget.volta,
              onTap: () {
                setState(() {
                  widget.volta = !widget.volta;
                });
              },
              iconColor: CustomColors.stateVerdePreto,
              textColor: CustomColors.stateVerdePreto,
              leading: CustomIcons.configuracaoVolta,
              title: const Text('Lembrete de Volta'),
              trailing: Switch(
                onChanged: (bool? value) {
                  setState(() {
                    widget.volta = value!;
                  });
                },
                value: widget.volta,
                activeColor: CustomColors.verdeEscuro,
              ),
            ),
          ],
        ));
  }
}
