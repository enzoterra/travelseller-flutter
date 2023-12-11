import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object-box.dart';
import 'package:travelseller/database/model/viagem.dart';

class ViagemController {
  List<Viagem> lista = [];
  late final ObjectBox controller;

  ViagemController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Viagem>();
  }

  create(
      String? codigoVenda,
      localizador,
      companhiaAerea,
      cidade,
      hotel,
      embarqueData,
      embarqueHora,
      observacoes,
      double? valorTotal,
      valorComissao) async {
    final viagem = Viagem(
        codigoVenda: codigoVenda,
        localizador: localizador,
        companhiaAerea: companhiaAerea,
        cidade: cidade,
        hotel: hotel,
        embarqueData: embarqueData,
        embarqueHora: embarqueHora,
        observacoes: observacoes,
        valorTotal: valorTotal,
        valorComissao: valorComissao);

    final box = await getBox();

    box.put(viagem);
  }

  update(Viagem viagem) async {
    final box = await getBox();

    box.put(viagem);
  }

  Future<Viagem> read(int id) async {
    final box = await getBox();

    return box.get(id) as Viagem;
  }

  readAll() async {
    final box = await getBox();

    lista = box.getAll() as List<Viagem>;

    return lista;
  }

  delete(Viagem viagem) async {
    final box = await getBox();

    box.remove(viagem.id);
  }
}
