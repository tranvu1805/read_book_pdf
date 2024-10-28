
import 'package:flutter/material.dart';

import '../book/book_page.dart';
import '../home/home_page.dart';
import '../setting/setting_page.dart';
import '../store/store_page.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    BookPage(),
    const StorePage(),
    const SettingPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        backgroundColor: Colors.white30,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: _onSearchIconClick,
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: _onUserIconClick, icon: const Icon(Icons.person)),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              //TODO edit pop menu item
              const PopupMenuItem(
                child: Text('Item 1'),
              ),
              const PopupMenuItem(
                child: Text('Item 2'),
              ),
              const PopupMenuItem(
                child: Text('Item 3'),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onSearchIconClick() {
    // TODO: Implement search feature
  }

  void _onUserIconClick() {
    // TODO: Implement feature
  }
}
