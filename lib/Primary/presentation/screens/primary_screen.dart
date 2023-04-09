import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/Account/presentation/screens/account_screen.dart';
import 'package:real_estate_app/Home/presentation/screens/home_screen.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/presentation/screens/maps_screen.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    BlocProvider<MapBloc>(
      create: (context) => MapBloc(),
      child: MapsScreen(),
    ),
    Container(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CubertoBottomBar(
        //key: Key('BottomBar'),
        selectedTab: _currentIndex,
        inactiveIconColor: Theme.of(context).primaryColor,
        tabColor: Colors.white,
        textColor: Colors.white,
        //padding: EdgeInsets.all(12),

        onTabChangedListener: (int position, String title, Color? tabColor) {
          setState(() {
            _currentIndex = position;
          });
        },
        tabs: [
          TabData(
            iconData: Icons.home,
            title: getTranslated('home', context),
          ),
          TabData(
            iconData: Icons.map_rounded,
            title: getTranslated('map', context),
          ),
          TabData(
            iconData: Icons.favorite,
            title: getTranslated('wishlist', context),
          ),
          TabData(
            iconData: Icons.person,
            title: getTranslated('profile', context),
          ),
        ],
      ),
    );
  }
}
