import 'package:quick_bank_ui/screens/home_screen.dart';
import 'package:quick_bank_ui/screens/profile_screen.dart';
import 'package:quick_bank_ui/screens/settings_screen.dart';
import 'package:quick_bank_ui/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'custom_values.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _pageIndex = 0;
  static const List<Widget> _pages = [
    HomeScreen(),
    TransferScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomValues.secondaryColor,
      body: _pages.elementAt(_pageIndex),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 12, top: 8),
        decoration: BoxDecoration(
          color: CustomValues.backgroundColor,
          border: Border.all(
            color: CustomValues.foregroundColor.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CustomValues.spacing),
            topRight: Radius.circular(CustomValues.spacing),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomValues.foregroundColor.withValues(alpha: 0.12),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(CustomValues.spacing),
            topRight: Radius.circular(CustomValues.spacing),
          ),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.swap_horiz_outlined),
                  label: 'Transfer',
                  activeIcon: Icon(Icons.swap_horiz),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                  activeIcon: Icon(Icons.settings),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_circle_outlined),
                  label: 'Profile',
                  activeIcon: Icon(Icons.person_pin_circle_sharp),
                ),
              ],
              currentIndex: _pageIndex,
              showUnselectedLabels: true,
              selectedItemColor: CustomValues.foregroundColor,
              unselectedItemColor: CustomValues.foregroundColor.withValues(
                alpha: 0.45,
              ),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              backgroundColor: CustomValues.backgroundColor,
              elevation: 0,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
