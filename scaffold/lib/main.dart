import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void function() {
    setState(() {
      print("pressed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Fluter Home Page"),
            backgroundColor: Colors.blue,
            actions: const <Widget>[
              Icon(Icons.account_circle),
              Icon(Icons.mail),
              Icon(Icons.phone),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.account_tree_sharp),
                ),
                Tab(
                  icon: Icon(Icons.account_box),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.archive_outlined),
              Icon(Icons.construction),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Example'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    print("add action");
                    Navigator.pop(context); //close after onTap
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    print("add action2");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ), //Drawer
          floatingActionButton: FloatingActionButton(
            onPressed: function,
            tooltip: 'change',
            child: const Icon(Icons.change_history),
            backgroundColor: Colors.blue,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              fixedColor: Colors.blue,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: "Account",
                  icon: Icon(Icons.account_circle),
                ),
              ],
              onTap: (int indexOfItem) {}),
        ),
      ),
    );
  }
}
