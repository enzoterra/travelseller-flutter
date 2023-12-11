import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/controller.dart';
import 'package:travelseller/database/model/cliente.dart';

class ClienteController {
  List<Cliente> lista = [];
  late final Controller controller;

  ClienteController(this.controller);

  Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Cliente>();
  }

  create(String? nome, cpf, rg, dataNascimento, int? idViagem) async {
    final cliente = Cliente(
        nome: nome,
        cpf: cpf,
        rg: rg,
        dataNascimento: dataNascimento,
        idViagem: idViagem);

    final box = await getBox();

    box.put(cliente);
  }

  update(Cliente cliente) async {
    final box = await getBox();

    box.put(cliente);
  }

  Future<Cliente> read(int id) async {
    final box = await getBox();

    return box.get(id) as Cliente;
  }

  readAll() async {
    final box = await getBox();

    lista = box.getAll() as List<Cliente>;
  }

  delete(Cliente cliente) async {
    final box = await getBox();

    box.remove(cliente.id);
  }
}
