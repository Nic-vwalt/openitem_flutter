//admin stateless widget with an appBar and a body and navbar with 5 icons in a row and a listview with list tiles
import 'package:flutter/material.dart';

import '../../home/screens/home_screen.dart';

class AdminScreen extends StatelessWidget {
  static const String routeName = '/admin_screen';
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // a litstview with list tiles that have a leading icon and a title
                ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('About'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const Text('Hello World'),
                Builder(builder: (context) {
                  return FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
    
                    },
                    child: const Icon(Icons.add),
                  );
                }),
              ],
            ),
          ),
        ),
//drawer with a listview with five listtiles that have icons
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                width: 50,
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Admin'),
                onTap: () {
                  Navigator.of(context).pushNamed(AdminScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('User'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Item'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Category'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Location'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('User'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Item'),
                onTap: () {
                  
                },
              ),
            ],
          )
      ),

    )
    );
  }
}