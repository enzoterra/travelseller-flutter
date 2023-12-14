import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/styles.dart';

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
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(7),
                child: const Center(
                    child: Image(
                  image: CustomIcons.iconeViagemTile,
                  height: 25,
                  width: 25,
                ))),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      nome,
                      style: Styles.nomeViagemTile,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      destino,
                      style: Styles.destinoViagemTile,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    Text(embarque, style: Styles.dataViagemTile),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(desembarque, style: Styles.dataViagemTile),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
