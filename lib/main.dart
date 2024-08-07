import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/pages/principais/home.dart';
import 'components/custom/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.create();

  requestPermissions();

  runApp(const App());
}

requestPermissions() async {
  if (await Permission.notification.status.isDenied) {
    Permission.notification.request();
  }
  if (await Permission.storage.status.isDenied) {
    Permission.storage.request();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CustomTitles.tituloApp,
      theme: CustomTheme.tema,
      home: const Home(
        currentIndex: 1,
      ),
    );
  }
}
