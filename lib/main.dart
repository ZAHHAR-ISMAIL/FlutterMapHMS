import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'LocationPage.dart';
import 'MapPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(199, 0, 10, 1)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/MapPage': (context) => const MapPage(),
        '/LocationPage': (context) => const LocationPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void requestPerms(type) async {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.locationWhenInUse,
        Permission.locationAlways,
      ].request();

      if (await Permission.location.status.isGranted) {
        if (type == "Map")
          Navigator.pushNamed(context, '/MapPage');
        else
          Navigator.pushNamed(context, '/LocationPage');
      } else {
        openAppSettings();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Open Map Page'),
                onPressed: () {
                  requestPerms("Map");
                },
              ),
              ElevatedButton(
                child: const Text('Open Location Page'),
                onPressed: () {
                  requestPerms("Location");
                },
              )
            ],
          ),
        ));
  }
}
