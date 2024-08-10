import 'package:flutter/material.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/scripts/settings.dart';

class ExportImportSettings extends StatelessWidget {
  const ExportImportSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Exportar e Importar dados",
            style: CustomStyles.topicoConfiguracoes,
          ),
          const SizedBox(
            height: CustomDimens.spaceFields,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: CustomDimens.heigthButtons,
                width: 110,
                child: TextButton(
                  onPressed: () {
                    AlertDialog(
                      title: const Text('Deseja exportar os dados?'),
                      content: const Text(
                          'Serão exportados para uma pasta chamada TravelSeller na pasta de documentos do aparelho'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            try {
                              SettingsScripts().exportar();
                              SettingsScripts()
                                  .createSnackBar('Dados exportados!', context);
                            } catch (error) {
                              SettingsScripts().createSnackBar(
                                  "Erro na exportação - $error", context);
                            }
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                        CustomColors.verdeExportar),
                    shape: CustomStyles.buttonStyle,
                  ),
                  child: const Text(
                    "Exportar",
                    style: CustomStyles.textoBotoesExport,
                  ),
                ),
              ),
              SizedBox(
                height: CustomDimens.heigthButtons,
                width: 110,
                child: TextButton(
                  onPressed: () {
                    AlertDialog(
                      title: const Text('Deseja importar os dados?'),
                      content: const Text(
                          'Serão importadors dados de Viagens, Clientes e Configurações'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            try {
                              SettingsScripts().importar(context);
                              SettingsScripts()
                                  .createSnackBar('Dados importados!', context);
                            } catch (error) {
                              SettingsScripts().createSnackBar(
                                  "Erro na importação - $error", context);
                            }
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                        CustomColors.verdeExportar),
                    shape: CustomStyles.buttonStyle,
                  ),
                  child: const Text(
                    "Importar",
                    style: CustomStyles.textoBotoesExport,
                  ),
                ),
              )
            ],
          )
        ]));
  }
}
