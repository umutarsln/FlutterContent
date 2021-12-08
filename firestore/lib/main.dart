import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize firebase
  await Firebase.initializeApp();
  runApp(const FireStoreApp());
}

class FireStoreApp extends StatefulWidget {
  const FireStoreApp({Key? key}) : super(key: key);

  @override
  _FireStoreAppState createState() => _FireStoreAppState();
}

class _FireStoreAppState extends State<FireStoreApp> {
  final textController =
      TextEditingController(); // Top, text editing controller

  @override
  Widget build(BuildContext context) {
    CollectionReference groceries = FirebaseFirestore.instance
        .collection('groceries'); // Collection instance

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
              // Connect the firebase firestore
              stream: groceries.orderBy('name').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                }
                return ListView(
                  children: snapshot.data!.docs.map((grocery) {
                    return Center(
                      child: ListTile(
                        title: Text(grocery['name']),
                        onLongPress: () {
                          // If press long, remove the item from database
                          grocery.reference.delete();
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          // New item add and save button
          child: const Icon(Icons.save),
          onPressed: () {
            groceries.add({
              'name': textController.text,
            });
            textController.clear();
          },
        ),
      ),
    );
  }
}
