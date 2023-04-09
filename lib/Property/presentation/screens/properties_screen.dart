import 'package:flutter/material.dart';
import '../widgets/loaded/properties_screen_loaded.dart';
import '../widgets/properties_screen_loading.dart';


class PropertiesScreen extends StatelessWidget {
  final String? category;
  const PropertiesScreen({super.key,
  this.category,
  });

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PropertiesScreenLoaded(category: category),
        //PropertiesScreenLoading(),
        //const PropertiesScreenLoaded(),
      ),
    );
  }
}
