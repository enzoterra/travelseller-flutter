import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/tiles/cadastro_cliente_tile.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    //final listaTiles = [const CadastroClienteTile()];

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: altura * 0.18,
          width: largura * 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/lago-azul.jpg'))),
          child: const Center(
              child: Text(
            Titles.tituloCadastro,
            style: Styles.tituloCadastro,
          )),
        ),
        /*SizedBox(
        height: altura * 0.4,
        width: largura * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 1,
                    child: Column(
                      children: [
                        const Text(
                          "Nome",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
                height: altura * 0.3,
                width: largura * 1,
                child: Row(
                  children: [
                    const Text(
                      "CPF",
                      style: Styles.subTituloCadastro,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    )
                  ],
                )),
            Row(
              children: [
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 0.4,
                    child: Column(
                      children: [
                        const Text(
                          "RG",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    )),
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 0.4,
                    child: Column(
                      children: [
                        const Text(
                          "Data de Nascimento",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    ))
              ],
            ),
          ],
        )),*/
        //const CadastroClienteTile(),
        /*SizedBox(
          height: altura * 0.7,
          width: largura * 0.85,
          child: Column(children: [
            Container(height: altura * 0.1, width: largura * 1, color: Colors.amber,),
            Container(height: altura * 0.1, width: largura * 1, color: Color.fromARGB(255, 15, 211, 168),),
            Container(height: altura * 0.1, width: largura * 1, color: const Color.fromARGB(255, 255, 7, 7),),
            TextFormField(decoration: const InputDecoration(border: UnderlineInputBorder()),)
          ]),
        )*/
        
        /*ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: altura * 0.4,
                  child: const CadastroClienteTile()),
              ],
            );
          },
        )*/
      ],
    ));
  }
}
