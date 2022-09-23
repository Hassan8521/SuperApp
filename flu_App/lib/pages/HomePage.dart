import 'package:flutter/material.dart';
import '/models/users.dart';
import '/utils/database_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.clear));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: (() {
            if (query.isEmpty) {
              close(context, null); //close searchbar
            } else {
              query = "";
            }
          }),
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ["Kenya", "uganda", "Tanzania", "Nairobi"];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: ((context, index) {
        final suggestion = suggestions[index];

        return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            });
      }),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Container();
}
