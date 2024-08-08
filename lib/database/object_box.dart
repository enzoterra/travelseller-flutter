import 'package:travelseller/database/data/objectbox.g.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/settings.dart';
import 'package:travelseller/database/model/estatistica.dart';
import 'package:travelseller/database/model/viagem.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  /*Store? store;

  Future<Store> getStore() async {
    return store = await openStore();
  }

  closeStore() {
    store!.close();
  }*/

  /*late final Store store;
  
  ObjectBox._create(this.store);

  static Future<ObjectBox> getStore() async {

    final store = await openStore();

    return ObjectBox._create(store);
  }*/

  //É uma representação do objectbox
  late final Store store;

  //Fornece o acesso a um tipo específico. Como nesse caso, o objeto Tarefa.
  static late final Box<Viagem> viagemBox;
  static late final Box<Cliente> clienteBox;
  static late final Box<Estatistica> estatisticaBox;
  static late final Box<Settings> configuracaoBox;

  ObjectBox._create(this.store) {
    // Adicione qualquer código de configuração adicional,
    //por exemplo construir consultas para carregar informações na
    //inicialização de alguma tela.
  }

  /// Cria uma instância de ObjectBox para usar em todo o aplicativo.
  static Future<void> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "travelseller"));
    ObjectBox._create(store);
    viagemBox = store.box<Viagem>();
    clienteBox = store.box<Cliente>();
    estatisticaBox = store.box<Estatistica>();
    configuracaoBox = store.box<Settings>();
  }
}
