import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/estatistica.dart';

class EstatisticaController {
  List<Estatistica> lista = [];
  late final ObjectBox controller;

  EstatisticaController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Estatistica>();
  }

  create(int? idViagem, ano, String? mes) async {
    final estatistica = Estatistica(idViagem: idViagem, ano: ano, mes: mes);

    final box = await getBox();

    box.put(estatistica);
  }

  update(Estatistica estatistica) async {
    final box = await getBox();

    box.put(estatistica);
  }

  Future<Estatistica> read(int id) async {
    final box = await getBox();

    return box.get(id) as Estatistica;
  }

  readAll() async {
    final box = await getBox();

    lista = box.getAll() as List<Estatistica>;

    return lista;
  }

  delete(Estatistica estatistica) async {
    final box = await getBox();

    box.remove(estatistica.id);
  }
}
