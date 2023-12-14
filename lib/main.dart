import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/pages/home.dart';
import 'components/custom/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.create();

  runApp(const App());
}

/*void main() {
  runApp(const App());
}*/

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Titles.tituloApp,
      theme: Tema.tema,
      home: const Home(
        currentIndex: 1,
      ),
    );
  }
}
