import 'package:flutter/material.dart';
import 'package:openitem_flutter/features/visitor/screens/visitor_screen.dart';

import '../../auth/screens/auth_screen.dart';

//stateless home screen widget with an appBar and a body and navbar with 5 icons in a row
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
    Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Visitor Workflow'),
          subtitle: const Text('Tap here to start'),
          onTap: () {
            Navigator.pushNamed(context, VisitorScreen.routeName);
          },
        ),
      ],
    ),
    Column(
      children: const [
        Text(
          'Index 0: Settings',
          style: optionStyle,
        ),
      ],
    ),
    Column(
      children: [
        const Text(
          'Click here to Logout',
          style: optionStyle,
        ),
        //floating action button to the auth screen
        FloatingActionButton(
          backgroundColor: Colors.white,
          
          onPressed: () {
            Navigator.pushNamed(context, AuthScreen.routeName);
          },
          child: const Icon(Icons.logout),
        ),

      ],
    ),
  ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: GlobalVariables.secondaryColor,
      //         ),
      //         child: Text('OpenItem'),
      //       ),
      //       SizedBox(
      //         width: 10,
      //         child: ListTile(
      //           title: const Text('Home'),
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         width: 10,
      //         child: ListTile(
      //           title: const Text('Settings'),
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         width: 10,
      //         child: ListTile(
      //           title: const Text('About'),
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
