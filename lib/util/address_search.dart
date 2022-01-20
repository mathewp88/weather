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
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
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
      builder: (context, snapshot) => query == ""?
      Container(
        child: Text('Enter Your Adress'),
      )
      : snapshot.hasData ? ListView.builder(itemBuilder: (context, i) => 
      ListTile(
        title: Text((snapshot.data[i] as Suggestion).description),
        onTap: (){},
      ),
      itemCount: snapshot.data.length,
      )
      :Container(
        child: CircularProgressIndicator(),)
      );
  }
}
