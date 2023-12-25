import 'package:travelseller/database/data/objectbox.g.dart';
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
      valorComissao,
      int idCliente) {
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
        valorComissao: valorComissao,
        idCliente: idCliente);

    viagem.codigoVenda ??= "";
    viagem.localizador ??= "";
    viagem.companhiaAerea ??= "";
    viagem.cidade ??= "";
    viagem.hotel ??= "";
    viagem.dataIda ??= "";
    viagem.horaIda ??= "";
    viagem.dataVolta ??= "";
    viagem.horaVolta ??= "";
    viagem.observacoes ??= "";
    viagem.valorTotal ??= 0;
    viagem.valorComissao ??= 0;
    //final box = await getBox();
    int id = box.put(viagem);
    //controller.closeStore();
    return id;
  }

  int update(Viagem viagem) {
    //final box = await getBox();
    final box = ObjectBox.viagemBox;
    int id = box.put(viagem);
    return id;
    //controller.closeStore();
  }

  Viagem read(int id) {
    //final box = await getBox();
    Viagem viagem = box.get(id) as Viagem;

    return viagem;
    //controller.closeStore();
  }

  Viagem readByCliente(int idCliente) {
    //final box = await getBox();
    Query<Viagem> query =
        box.query(Viagem_.idCliente.equals(idCliente)).build();
    List<Viagem> lista = query.find();
    query.close();
    if (lista.isNotEmpty) {
      Viagem viagem = lista.first;
      return viagem;
    }
    //Cliente cliente = box.get(id) as Cliente;
    //controller.closeStore();
    return Viagem(idCliente: -1);
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
