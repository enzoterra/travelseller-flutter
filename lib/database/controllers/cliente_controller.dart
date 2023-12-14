import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/cliente.dart';

class ClienteController {
  List<Cliente> lista = [];
  late final ObjectBox controller;

  //ClienteController(this.controller);

  /*Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Cliente>();
  }*/

  int create(String? nome, cpf, rg, dataNascimento, int? idViagem) {
    final cliente = Cliente(
        nome: nome,
        cpf: cpf,
        rg: rg,
        dataNascimento: dataNascimento,
        idViagem: idViagem);

    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    int id = box.put(cliente);
    //controller.closeStore();
    return id;
  }

  update(Cliente cliente) async {
    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    box.put(cliente);
    //controller.closeStore();
  }

  Future<Cliente> read(int id) async {
    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    Cliente cliente = box.get(id) as Cliente;
    //controller.closeStore();
    return cliente;
  }

  Future<List<Cliente>> readAll() async {
    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    List<Cliente> lista = box.getAll() as List<Cliente>;
    //controller.closeStore();
    return lista;
  }

  List<Cliente> lerTodos() {
    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    List<Cliente> lista = box.getAll();
    //controller.closeStore();
    return lista;
  }

  delete(Cliente cliente) async {
    //final box = await getBox();
    final box = ObjectBox.clienteBox;
    box.remove(cliente.id);
    //controller.closeStore();
  }
}
