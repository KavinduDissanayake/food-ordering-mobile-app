
import 'package:flutter/material.dart';
import 'package:foodapp/screens/homeScreen.dart';
import 'package:foodapp/screens/menuScreen.dart';
import 'package:foodapp/screens/moreScreen.dart';
import 'package:foodapp/screens/offerScreen.dart';
import 'package:foodapp/screens/profileScreen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../const/colors.dart';
import '../../const/themes.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
     ProfileScreen(),
     HomeScreen(),
     OfferScreen(),
     ProfileScreen(),
     MoreScreen()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Card(
        margin: const EdgeInsets.only(top: 2, right: 8, left: 8),
        elevation: 4,
        color: Theme.of(context).bottomAppBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.bag_outline),
              label: 'Offer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.grid_outline),
              label: 'Menu',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor:   AppColor.orange,
          onPressed: () {
           bottomSheetView(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> bottomSheetView(BuildContext context) {
    return showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const MenuScreen(),
    );
  }
 }
