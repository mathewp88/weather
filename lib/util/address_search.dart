import 'package:flutter/material.dart';
import 'package:weather/util/findplace.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  late final sessionToken;
  late PlaceApiProvider apiClient;

  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: query == '' ? null : apiClient.fetchSuggestions(query, 'en'),
      builder: (context, snapshot) => query == ""
          ? Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Container(
                  child: Text(
                    'Enter Your Adress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ))
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, i) => ListTile(
                    title: Text((snapshot.data.toString()[i] as Suggestion)
                        .description),
                    onTap: () {},
                  ),
                  itemCount: snapshot.data.toString().length,
                )
              : Scaffold(
                  body: Center(
                      child: Container(child: CircularProgressIndicator())),
                  backgroundColor: Colors.black,
                ),
    );
  }
}
