import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:question_2/lib_http.dart';
import 'package:question_2/transfert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final nb1 = TextEditingController();
  final nb2 = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nb1,
              decoration: InputDecoration(
                hintText: "Nombre 1",
                labelText: "Nombre 1"
              ),
            ),
            TextField(
              controller: nb2,
              decoration: InputDecoration(
                  hintText: "Nombre 2",
                  labelText: "Nombre 2"
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          try{
            RequetePlusGrand req = RequetePlusGrand();
            try{
              req.val1 = int.parse(nb1.text);
              req.val2 = int.parse(nb2.text);
            }
            catch(e){
              final snackBarUser = SnackBar(
                content: Text("L'un des nombres n'est pas un nombre entier."),
                backgroundColor: Colors.blue,
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBarUser);
            }
            var response = await PlusGrand(req);
            final snackBarUser = SnackBar(
              content: Text("La plus grande des deux valeurs est " + response.toString()),
              backgroundColor: Colors.blue,
            );
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarUser);
          }
          on DioError catch(e){
            String message = e.response!.data;
            print(message);

            if(message == "NombresEgaux"){
              final snackBarUser = SnackBar(
                content: Text("Les nombres sont egaux."),
                backgroundColor: Colors.blue,
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBarUser);
            }
          }
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
