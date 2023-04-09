import 'package:flutter/material.dart';

import '../Widgets/properties_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Search')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PropertiesSearchBar(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
