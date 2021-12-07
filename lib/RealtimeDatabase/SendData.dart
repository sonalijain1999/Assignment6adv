import 'package:assignment6adv/RealtimeDatabase/readingData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
class SendData extends StatefulWidget {
  const SendData({Key? key}) : super(key: key);
  @override
  _SendDataState createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {


  final data = TextEditingController();
  final description = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  void addData(String data,String description) {
    databaseRef.push().set({'name': data, 'comment': description});
  }
 // //get value
 //  String printFirebase(){
 //    databaseRef.once().then((DataSnapshot snapshot) {
 //      return snapshot.value.toString() ;
 //    });
 //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot)
    {
      if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      } else {
        return ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: data,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                      ),

                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter description ',
                      ),

                      controller:description,
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                        child: const Text("Send to Database"),
                        onPressed: () {

                          addData(data.text,description.text);
                          data.clear();
                          description.clear();
                        }

                    ),
                  ),
                  Center(
                    child: RaisedButton(
                        child: const Text("Get data to Database"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReadingData()));
                        }
                    ),
                  ),

                ],
              ),
            ),
          ]
        );
      }
    }
        ) );
  }
}
