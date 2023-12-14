import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/configuracao.dart';

class ConfiguracaoController {
  final box = ObjectBox.configuracaoBox;

  //ClienteController(this.controller);

  /*Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Cliente>();
  }*/

  int create(
      bool? embarque, desembarque, umaHora, umDia, doisDias, limpar, passar) {
    final configuracao = Configuracao(
        embarque: embarque,
        desembarque: desembarque,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);

    //final box = await getBox();
    int id = box.put(configuracao);
    //controller.closeStore();
    return id;
  }

  update(Configuracao configuracao) {
    //final box = await getBox();
    box.put(configuracao);
    //controller.closeStore();
  }

  Configuracao read(int id) {
    //final box = await getBox();
    Configuracao configuracao = box.get(id) as Configuracao;
    //controller.closeStore();
    return configuracao;
  }

  /*Future<List<Cliente>> readAllFuture() async {
    final box = await getBox();
    List<Cliente> lista = box.getAll() as List<Cliente>;
    controller.closeStore();
    return lista;
  }*/

  List<Configuracao> readAll() {
    //final box = await getBox();
    List<Configuracao> lista = box.getAll();
    //controller.closeStore();
    return lista;
  }

  delete(Configuracao configuracao) {
    //final box = await getBox();
    box.remove(configuracao.id);
    //controller.closeStore();
  }
  /* List<Configuracao> lista = [];
  late final ObjectBox controller;

  /*ConfiguracaoController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Configuracao>();
  }*/

  int create(bool? embarque, desembarque, umaHora, umDia, doisDias, limpar,
      passar) {
    final configuracao = Configuracao(
        embarque: embarque,
        desembarque: desembarque,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);

    //final box = getBox();
    int id = box.put(configuracao);
    //controller.closeStore();
    return id;
  }

  update(Configuracao configuracao) {
    //final box = getBox();
    box.put(configuracao);
    //controller.closeStore();
  }

  /*Future<Configuracao> read(int id) async {
    final box = await getBox();
    Configuracao configuracao = box.get(id) as Configuracao;
    controller.closeStore();
    return configuracao;
  }

  Future<List<Configuracao>> readAll() async {
    final box = await getBox();
    lista = box.getAll() as List<Configuracao>;
    controller.closeStore();
    return lista;
  }*/

  Configuracao read(int id) {
    //final box = await getBox();
    Configuracao configuracao = box.get(id) as Configuracao;
    //controller.closeStore();
    return configuracao;
  }

  List<Configuracao> readAll() {
    //final box = getBox();
    lista = box.getAll() as List<Configuracao>;
    //controller.closeStore();
    return lista;
  }

  delete(Configuracao configuracao) {
    //final box = getBox();
    box.remove(configuracao.id);
    //controller.closeStore();
  }*/
}
