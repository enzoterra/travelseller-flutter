import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/database/model/settings.dart';

class SettingsController {
  final box = ObjectBox.configuracaoBox;

  int create(Settings settings) {
    int id = box.put(settings);
    return id;
  }

  update(Settings settings) {
    box.put(settings);
  }

  Settings read(int id) {
    Settings settings = box.get(id) as Settings;
    return settings;
  }

  List<Settings> readAll() {
    List<Settings> lista = box.getAll();
    return lista;
  }

  delete(Settings settings) {
    box.remove(settings.id);
  }
}
