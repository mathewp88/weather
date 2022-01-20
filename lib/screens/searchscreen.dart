import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:weather/util/address_search.dart';
import 'package:weather/util/findplace.dart';

String value = "";

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
          children: <Widget>[
            TextField(
              controller: myController,
              onTap: () async {
                final sessionToken = Uuid().v4();
                final Suggestion? result = await showSearch(
                    context: context, delegate: AddressSearch(sessionToken));
                if (result != null) {
                  setState(() {
                    myController.text = result.description;
                  });
                }
              },
              decoration: InputDecoration(
                hintText: 'Find Location',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
