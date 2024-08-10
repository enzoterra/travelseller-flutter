import 'package:flutter/material.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/styles.dart';

class ViagemListTile extends StatelessWidget {
  const ViagemListTile({
    super.key,
    required this.nome,
    required this.destino,
    required this.embarque,
    required this.desembarque,
  });

  final String nome;
  final String destino;
  final String embarque;
  final String desembarque;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
          color: CustomColors.cinzaTileViagens,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(5),
                child: const Center(
                    child: Image(
                  image: CustomIcons.iconeViagemTile,
                  height: 25,
                  width: 25,
                ))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      nome,
                      style: CustomStyles.nomeViagemTile,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      destino,
                      style: CustomStyles.destinoViagemTile,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 1,
                ),
                Text(embarque, style: CustomStyles.dataViagemTile),
                const SizedBox(
                  height: 6,
                ),
                Text(desembarque, style: CustomStyles.dataViagemTile),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
