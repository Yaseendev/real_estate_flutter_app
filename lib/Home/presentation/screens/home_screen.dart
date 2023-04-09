import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/presentation/screens/list_property.dart';
import 'package:real_estate_app/Property/presentation/screens/properties_screen.dart';
import 'package:real_estate_app/Search/presentation/Screens/search_screen.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import '../widgets/banner_view.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_listings.dart';
import '../widgets/location_header.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 4));
          },
          child: ListView(
            shrinkWrap: false,
            children: [
              LocationHeader(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: SearchBox(
                  onPress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  },
                ),
              ),
              const BannerView(),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated('properties', context),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PropertiesScreen()));
                      },
                      child: Row(
                        children: [
                          Text('${getTranslated('see_all', context)} '),
                          const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: CategoriesSection(),
              ),

              //Featured Houses Section
              HomeListings(
                sectionName: getTranslated('nearby', context),
              ),
              HomeListings(
                sectionName: getTranslated('new_properties', context),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 6.0),
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => ListPropertyScreen(
                  // selectedStatus: getTranslated('finished', ctx),
                  // paymentOption: getTranslated('sell', ctx),
                  ))),
          label: Text(getTranslated('sell_rent', context)),
          icon: Icon(Icons.real_estate_agent_rounded),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //endDocked,
    );
  }
}
