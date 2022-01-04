import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_ebusiness/screen/about.dart';
import 'package:project_ebusiness/screen/home_screen.dart';
import 'package:project_ebusiness/screen/kontak_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectIndex = 0;
  List<Widget> _widgetOptions = [
    HomeScreen(),
    KontakScreen(),
    AboutScreen(),
  ];

  void _onTapItem(index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.shoppingCart,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outlined,
            ),
            label: 'About',
          ),
        ],
        elevation: 1,
        currentIndex: _selectIndex,
        onTap: _onTapItem,
        selectedItemColor: Color(0XFF9B4B26),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        backgroundColor: Colors.white,
      ),
    );
  }
}
