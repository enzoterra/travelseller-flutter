import 'package:objectbox/objectbox.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/cliente.dart';

class ClienteController {
  //late final ObjectBox controller;
  final box = ObjectBox.clienteBox;

  //ClienteController(this.controller);

  /*Future<Box> getBox() async {
    final store = await controller.getStore();

    return store.box<Cliente>();
  }*/

  int create(String nome, String? cpf, rg, dataNascimento, int? idViagem) {
    final cliente = Cliente(
        nome: nome,
        cpf: cpf,
        rg: rg,
        dataNascimento: dataNascimento,
        idViagem: idViagem);

    cliente.nome ??= "";
    cliente.cpf ??= "";
    cliente.rg ??= "";
    cliente.dataNascimento ??= "";

    //final box = await getBox();
    int id = box.put(cliente);
    //controller.closeStore();
    return id;
  }

  update(Cliente cliente) {
    //final box = await getBox();
    box.put(cliente);
    //controller.closeStore();
  }

  Cliente read(int id) {
    //final box = await getBox();
    Cliente cliente = box.get(id) as Cliente;
    //controller.closeStore();
    return cliente;
  }

  /*Future<List<Cliente>> readAllFuture() async {
    final box = await getBox();
    List<Cliente> lista = box.getAll() as List<Cliente>;
    controller.closeStore();
    return lista;
  }*/

  List<Cliente> readAll() {
    //final box = await getBox();
    List<Cliente> lista = box.getAll();
    //controller.closeStore();
    return lista;
  }

  delete(Cliente cliente) {
    //final box = await getBox();
    box.remove(cliente.id);
    //controller.closeStore();
  }
}
