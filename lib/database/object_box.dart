import 'package:travelseller/database/data/objectbox.g.dart';

class ObjectBox {
  Store? store;

  Future<Store> getStore() async {
    return store = await openStore();
  }

  closeStore(){
    store!.close();
  }
  
  /*late final Store store;
  
  ObjectBox._create(this.store);

  static Future<ObjectBox> getStore() async {

    final store = await openStore();

    return ObjectBox._create(store);
  }*/
}