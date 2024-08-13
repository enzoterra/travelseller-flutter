import 'package:flutter/material.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/images.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/custom/titles.dart';
import 'package:travelseller/components/topbar/top_bar.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:travelseller/pages/estatisticas/ano.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  EstatisticasState createState() => EstatisticasState();
}

class EstatisticasState extends State<Estatisticas> {
  List<Viagem> lista = [];
  var listaAno = [];
  List<String> anos = [];
  Map<String, List<double>> valores = {};

  @override
  void initState() {
    super.initState();

    lista = ViagemController().readAll();
    for (Viagem viagem in lista) {
      var dataPreString = viagem.dataIda!.split("/");
      var ano = dataPreString[2];
      if (!anos.contains(ano)) {
        anos.add(ano);
      }
      listaAno.add({ano: viagem});

      if (valores.containsKey(ano)) {
        valores[ano]!.add(viagem.valorComissao!.toDouble());
      } else {
        valores[ano] = [viagem.valorComissao!.toDouble()];
      }
      /*else {
        double qtdMes = qtd.last;
        qtdMes += 1;
        qtd[qtd.length - 1] = qtdMes;
      }*/
    }

    anos.sort((a, b) => a.compareTo(b));
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return PopScope(
        canPop: false,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          const TopBar(
            imagem: CustomImages.imagemEstatisticas,
            titulo: CustomTitles.tituloEstatisticas,
          ),
          Container(
            height: altura * 0.11,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(CustomTitles.subTituloEstatisticas,
                      style: CustomStyles.subTituloPagina),
                ]),
          ),
          Container(
              height: altura * 0.6,
              width: largura * CustomDimens.widthLists,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: CustomStyles.boxDecorationListas,
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10, bottom: 7),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 5,
                      ),
                  itemCount: anos.length,
                  itemBuilder: (context, index) {
                    if (anos.isEmpty) {
                      return const Center(child: Text("Sem clientes ..."));
                    } else {
                      double valorTotal = 0;

                      var lista = valores[anos[index]];
                      lista?.forEach(
                        (element) => valorTotal += element,
                      );

                      return ListTile(
                          leading: CustomIcons.calendar,
                          title: Text(
                            anos[index],
                            style: CustomStyles.topicoConfiguracoes,
                          ),
                          trailing: Text(
                            "R\$ ${valorTotal}",
                            style: CustomStyles.textoEstatisticas,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AnosPage(
                                          ano: anos[index],
                                          listaAno: listaAno,
                                        ))));
                          });
                    }
                  }))
        ]))));
  }
}
