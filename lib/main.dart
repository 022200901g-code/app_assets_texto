import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),
      home: const MyHomePage(title: 'Flutter demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePage> {
  String textFromFile = 'vacio';

  Future<void> getData() async {
    String response = await rootBundle.loadString('archivo_texto/mis_apuntes.txt');
    setState(() {
      textFromFile = response;
    });
  }

  void clear() {
    setState(() {
      textFromFile = 'Vacio';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textFromFile, style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Get data'),
            ),
            ElevatedButton(
              onPressed: () {
                clear();
              },
              child: const Text('clear'),
            ),
          ],
        ),
      ),
    );
  }
}
