import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter demo',
      theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, ),
      home: const MyHomePage(Title: 'flutter demo home page'),  
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePage>{
  String textFromFile = 'vacio';

  getData() async {
    String response;
    response = await rootBundle.loadString('archivo_texto/mis_apuntes.txt');
    setState(() {
      textFromFile = response;
    });
  }
  clear(){
    setState(() {
      textFromFile = 'Vacio';
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textFromFile, style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(onPressed: () {getData(); }, child: const Text('Get data',),),
            ElevatedButton(onPressed: () {clear(); }, child: const Text('clear',),),

          ],
          ),
      )        
    ),
  }
}
