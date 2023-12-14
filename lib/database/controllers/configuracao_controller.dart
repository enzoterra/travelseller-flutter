import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/configuracao.dart';

class ConfiguracaoController {
  /* List<Configuracao> lista = [];
  late final ObjectBox controller;

  ConfiguracaoController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Configuracao>();
  }

  Future<int> create(bool? embarque, desembarque, umaHora, umDia, doisDias, limpar,
      passar) async {
    final configuracao = Configuracao(
        embarque: embarque,
        desembarque: desembarque,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);

    final box = await getBox();
    int id = box.put(configuracao);
    controller.closeStore();
    return id;
  }

  update(Configuracao configuracao) async {
    final box = await getBox();
    box.put(configuracao);
    controller.closeStore();
  }

  Future<Configuracao> read(int id) async {
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
  }

  delete(Configuracao configuracao) async {
    final box = await getBox();
    box.remove(configuracao.id);
    controller.closeStore();
  }*/
}
