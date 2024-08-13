import 'package:flutter/material.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/images.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/estatisticas/mes.dart';

class AnosPage extends StatefulWidget {
  const AnosPage({super.key, required this.ano, required this.listaAno});

  final String ano;
  final List<dynamic> listaAno;

  @override
  AnosPageState createState() => AnosPageState();
}

class AnosPageState extends State<AnosPage> {
  List viagensAno = [];
  List<String> meses = [];
  var listaMeses = [
    {
      '01': 'Janeiro',
      '02': 'Fevereiro',
      '03': 'Março',
      '04': 'Abril',
      '05': 'Maio',
      '06': 'Junho',
      '07': 'Julho',
      '08': 'Agosto',
      '09': 'Setembro',
      '10': 'Outubro',
      '11': 'Novembro',
      '12': 'Dezembro'
    }
  ];
  var mesesStr = [];

  @override
  void initState() {
    super.initState();

    viagensAno = widget.listaAno.map((v) => v[widget.ano]).toList();

    for (var viagemMap in viagensAno) {
      Viagem viagem = viagemMap;
      var string = viagem.dataIda!.split("/");
      var mes = string[1];
      if (!meses.contains(mes)) {
        meses.add(mes);
      }
    }

    meses.sort((a, b) => a.compareTo(b));
    for (int i = 0; i < meses.length; i++) {
      listaMeses.map((m) => mesesStr.add(m[meses[i]])).toList();
    }
    print(mesesStr);
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
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                                title: Text(mesesStr[index]),
                                onTap: () {
                                  List listaMes = [];
                                  for (Viagem viagem in viagensAno) {
                                    var string = viagem.dataIda!.split("/");
                                    var mes = string[1];
                                    if (mes == meses[index]) {
                                      listaMes.add(viagem);
                                    }
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              MesPage(mes: mesesStr[index], listaMes: listaMes,))));
                                });
                          }
                        }),
                  )))
        ],
      ),
    );
  }
}
