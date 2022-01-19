import 'package:flutter/material.dart';

String value = "";

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

final myController = TextEditingController();

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                label: Text('Find Location'),
                prefixIcon: Icon(Icons.search),
              ),
              controller: myController,
              onSubmitted: null,
            ),
          ],
        ),
      ),
    );
  }
}
