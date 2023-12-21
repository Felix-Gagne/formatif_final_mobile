import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _isPushed = "Vous n'avez envoyer aucun fichier.";

  void _incrementCounter() {

    setState(() {

    });
  }

  Future<void> AddCollection() async{

    try{
      final db = FirebaseFirestore.instance;

      final doc = <String, dynamic>{
        "firstName":"Felix",
        "lastName":"Gagne",
        "creationDate":DateTime.now(),
        "expectedExamScore":100
      };

      await db.collection("super-gagne-felix-infini").add(doc);

      _isPushed = "Le document a ete ajouter!";
      setState(() {

      });
    }
    catch(e){
      _isPushed = "Erreur";
      setState(() {

      });
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_isPushed',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: AddCollection,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}