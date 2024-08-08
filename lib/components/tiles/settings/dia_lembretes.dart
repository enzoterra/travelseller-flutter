import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/styles.dart';

// ignore: must_be_immutable
class DiaLembretes extends StatefulWidget {
  DiaLembretes({super.key, required this.umDia, required this.doisDias});

  bool umDia;
  bool doisDias;

  @override
  DiaLembretesState createState() => DiaLembretesState();
}

class DiaLembretesState extends State<DiaLembretes> {
  double espaco = 20;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Com quanto tempo de antecedência deseja receber os lembretes?",
            style: CustomStyles.topicoConfiguracoes,
          ),
          SizedBox(
            height: espaco,
          ),
          ListTile(
            selected: widget.umDia,
            onTap: () {
              setState(() {
                //SettingsPageState().toggleSwitch('umDia');
                widget.umDia = !widget.umDia;
              });
            },
            iconColor: CustomColors.stateVerdePreto,
            textColor: CustomColors.stateVerdePreto,
            leading: CustomIcons.configuracaoUmDia,
            title: const Text('1 dia antes'),
            trailing: Switch(
              onChanged: (bool? value) {
                setState(() {
                  //SettingsPageState().toggleSwitch('umDia');
                  widget.umDia = value!;
                });
              },
              value: widget.umDia,
              activeColor: CustomColors.verdeEscuro,
            ),
          ),
          SizedBox(
            height: espaco,
          ),
          ListTile(
            selected: widget.doisDias,
            onTap: () {
              setState(() {
                //SettingsPageState().toggleSwitch('doisDias');
                widget.doisDias = !widget.doisDias;
              });
            },
            iconColor: CustomColors.stateVerdePreto,
            textColor: CustomColors.stateVerdePreto,
            leading: CustomIcons.configuracaoDoisDias,
            title: const Text('2 dias antes'),
            trailing: Switch(
              onChanged: (bool? value) {
                setState(() {
                  widget.doisDias = value!;
                });
              },
              value: widget.doisDias,
              activeColor: CustomColors.verdeEscuro,
            ),
          ),
        ]));
  }
}
