import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/estatisticas/mes.dart';

class AnosPage extends StatefulWidget {
  const AnosPage({super.key, required this.ano});

  final String ano;

  @override
  AnosPageState createState() => AnosPageState();
}

class AnosPageState extends State<AnosPage> {
  List<Viagem> viagens = [];
  List<String> meses = [];

  @override
  void initState() {
    super.initState();

    viagens = ViagemController().readAll();
    for (Viagem viagem in viagens) {
      var mes = viagem.dataIda!.split("/")[1];
      var ano = viagem.dataIda!.split("/")[2];
      if (ano == widget.ano) {
        if (!mes.contains(mes)) {
          meses.add(mes);
        }
      }
    }

    setState(() {
      meses = meses;
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          InternTopbar(
            imagem: CustomImages.imagemInternEstatisticas,
            titulo: widget.ano,
            index: 0,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                  height: altura * 0.7,
                  width: largura * 0.9,
                  child: Container(
                    decoration: CustomStyles.boxDecorationListas,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 5,
                            ),
                        itemCount: meses.length,
                        itemBuilder: (context, index) {
                          if (meses.isEmpty) {
                            return const Center(
                                child: Text("Sem clientes ..."));
                          } else {
                            return ListTile(
                                leading: CustomIcons.calendar,
                                title: Text(meses[index]),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              MesPage(mes: meses[index]))));
                                });
                          }
                        }),
                  )))
        ],
      ),
    );
  }
}
