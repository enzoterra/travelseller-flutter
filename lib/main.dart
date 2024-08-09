import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/database/object_box.dart';
import 'package:travelseller/pages/principais/home.dart';
import 'package:workmanager/workmanager.dart';
import 'components/custom/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.create();

  await requestPermissions();

  // Initialize Workmanager
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const App());
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    //checkTripsAndNotify(context);
    print('ahhhhhhhhhhhhhhhh');
    return Future.value(true);
  });
  /*Workmanager().executeTask((task, inputData) {
      checkTripsAndNotify(context);
      markTaskAsCompleted(inputData?['taskName']);
      return Future.value(true);
    });*/
}

requestPermissions() async {
  if (await Permission.notification.status.isDenied) {
    Permission.notification.request();
  }
  if (await Permission.manageExternalStorage.status.isDenied) {
    Permission.manageExternalStorage.request();
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
