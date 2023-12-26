import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/configuracao.dart';

class ConfiguracaoController {
  final box = ObjectBox.configuracaoBox;

  int create(Configuracao configuracao) {
    int id = box.put(configuracao);
    return id;
  }

  update(Configuracao configuracao) {
    box.put(configuracao);
  }

  Configuracao read(int id) {
    ;
    Configuracao configuracao = box.get(id) as Configuracao;
    return configuracao;
  }

  List<Configuracao> readAll() {
    List<Configuracao> lista = box.getAll();
    return lista;
  }

  delete(Configuracao configuracao) {
    box.remove(configuracao.id);
  }
}
