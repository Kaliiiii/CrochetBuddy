import 'package:flutter/material.dart';
import 'Counter.dart';
import 'Projects.dart';
import 'NewProject.dart';
import 'Settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void toCounterPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CounterPage(title: 'Counter')));
  }

  void toProjectsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjectsPage(title: 'My Projects')));
  }

  void toNewProjectPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewProjectPage(title: 'My Projects')));
  }

  void toSettingsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(title: 'Settings')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Images/title.png'),
            ElevatedButton(
                onPressed: () {
                  toCounterPage();
                },
                child: Text('Quick Start')),
            ElevatedButton(
                onPressed: () {
                  toProjectsPage();
                },
                child: Text('My Projects')),
            Image.asset(
                'assets/Images/cat-playing-with-ball-of-yarn-silhouette-pet-lover-svg-file-SVGHEART.COM.png'),
            FloatingActionButton(
                onPressed: toSettingsPage,
                tooltip: 'Settings',
                child: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
