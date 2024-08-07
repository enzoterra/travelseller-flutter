import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/styles.dart';

class CancelarButton extends StatelessWidget {
  const CancelarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: CustomDimens.heigthButtons,
        width: 110,
        child: TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          style: ButtonStyle(
            backgroundColor:
                const WidgetStatePropertyAll(CustomColors.cinzaCancelar),
            shape: CustomStyles.buttonStyle,
          ),
          child: const Text(
            "Cancelar",
            style: CustomStyles.cancelarTexto,
          ),
        ));
  }
}
