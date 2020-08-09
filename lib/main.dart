import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                var myData = jsonDecode(snapshot.data.toString());

                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name: " + myData[index]['name']),
                          new Text('Age: ' + myData[index]['age']),
                          new Text("Gender: " + myData[index]['gender']),
                          new Text("Height: " + myData[index]['height']),
                        ],
                      ),
                    );
                  },
                  itemCount: myData == null ? 0 : myData.length,
                );
              }),
        ),
      ),
    );
  }
}
