import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';
import 'package:konterapps/screens/screens.dart';

class BtmNavScreen extends StatefulWidget {
  @override
  _BtmNavScreenState createState() => _BtmNavScreenState();
}

class _BtmNavScreenState extends State<BtmNavScreen> {
  final List _screens = [
    HomeScreen(),
    ListItemScreen(),
    ListOrderScreen(),
    UserProfileScreen()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_overscan, color: Colors.white),
        onPressed: () {},
        hoverElevation: 0.0,
        elevation: 0.0,
        highlightElevation: 0.0,
        backgroundColor: AppColors.orange2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.green1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        iconSize: 27.0,
        elevation: 5,
        unselectedItemColor: AppColors.green3,
        items: [
          Icons.home,
          Icons.view_list,
          Icons.assignment,
          Icons.perm_identity
        ]
            .asMap()
            .map((key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                            color: _currentIndex == key
                                ? AppColors.green3
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(
                          value,
                        )))))
            .values
            .toList(),
      ),
    );
  }
}
