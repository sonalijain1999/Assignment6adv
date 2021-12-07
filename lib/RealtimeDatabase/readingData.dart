import 'dart:async';

import 'package:assignment6adv/RealtimeDatabase/readingData.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class ReadingData extends StatefulWidget {
  const ReadingData({Key? key}) : super(key: key);

  @override
  _ReadingDataState createState() => _ReadingDataState();
}

class _ReadingDataState extends State<ReadingData> {
  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("back"),
        ),
        body:    Container(
          
          child: Column(
            children: [
              Expanded(
                child: Flexible(
                  child: FirebaseAnimatedList(
                      query: databaseRef, shrinkWrap:true,itemBuilder: (context,snapshot,animation,index){
                    return ListTile (
                        title: Text(snapshot.value.toString()),
                        trailing: IconButton(
                          onPressed: ()=>databaseRef.child(snapshot.key!).remove(),
                          icon: Icon(Icons.delete),
                        )

                    );
                  }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
