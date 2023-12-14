import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/viagem.dart';

class ViagemController {
  /*List<Viagem> lista = [];
  late final ObjectBox controller;*/
  final box = ObjectBox.viagemBox;

  /* ViagemController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Viagem>();
  }*/

  int create(
      String? codigoVenda,
      localizador,
      companhiaAerea,
      cidade,
      hotel,
      dataIda,
      horaIda,
      dataVolta,
      horaVolta,
      observacoes,
      double? valorTotal,
      valorComissao) {
    final viagem = Viagem(
        codigoVenda: codigoVenda,
        localizador: localizador,
        companhiaAerea: companhiaAerea,
        cidade: cidade,
        hotel: hotel,
        dataIda: dataIda,
        horaIda: horaIda,
        dataVolta: dataVolta,
        horaVolta: horaVolta,
        observacoes: observacoes,
        valorTotal: valorTotal,
        valorComissao: valorComissao);

    //final box = await getBox();
    int id = box.put(viagem);
    //controller.closeStore();
    return id;
  }

  update(Viagem viagem) {
    //final box = await getBox();
    final box = ObjectBox.viagemBox;
    box.put(viagem);
    //controller.closeStore();
  }

  Viagem read(int id) {
    //final box = await getBox();
    Viagem viagem = box.get(id) as Viagem;
    //controller.closeStore();
    return viagem;
  }

  /*Future<List<Viagem>> readAll() async {
    //final box = await getBox();
    final box = ObjectBox.viagemBox;
    lista = box.getAll() as List<Viagem>;
    //controller.closeStore();
    return lista;
  }*/

  List<Viagem> readAll() {
    //final box = await getBox();
    List<Viagem> lista = box.getAll();
    //controller.closeStore();
    return lista;
  }

  delete(Viagem viagem) {
    // final box = await getBox();
    box.remove(viagem.id);
    // controller.closeStore();
  }
}
