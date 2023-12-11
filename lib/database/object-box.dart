import 'package:travelseller/database/data/objectbox.g.dart';

class ObjectBox {
  Store? store;

  Future<Store> getStore() async {
    return store ??= await openStore();
  }
}