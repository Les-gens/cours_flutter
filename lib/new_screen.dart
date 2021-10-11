import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Books"),
            centerTitle: true,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.people),
                  child: Text("Popular"),
                ),
                Tab(
                  icon: Icon(Icons.new_releases),
                  child: Text("New"),
                ),
                Tab(
                  icon: Icon(Icons.list),
                  child: Text("All"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: ListView(
                  children: const <Widget>[
                    ListTile(
                        title: Text(
                          'Left hand of darkness',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Ursulla K. Le Guin',
                        )),
                    ListTile(
                        title: Text(
                          'Kindred',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Octavia E. Butler',
                        )),
                  ],
                ),
              ),
              const Center(
                child: Text("New"),
              ),
              const Center(
                child: Text("All"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Authors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}
