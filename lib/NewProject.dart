import 'package:flutter/material.dart';
import 'Projects.dart';
import 'Settings.dart';
import 'project_data.dart';
import 'globals.dart' as globals;

project newProject = project('', '', 0, 0, 0, 0);

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({super.key, required this.title});

  final String title;

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  final pnameController = TextEditingController();
  final stitchController = TextEditingController();
  final rowController = TextEditingController();
  List<String> stitchList = ['slip', 'single', 'double', 'triple'];
  String dropdownValue = '';

  void toSettingsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(title: 'Settings')));
  }

  void toProjectsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjectsPage(title: 'Projects')));
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
            TextField(
              controller: pnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Stitch Type'),
            ),
            DropdownButtonB(),
            TextField(
              controller: stitchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of Stitches',
              ),
            ),
            TextField(
              controller: rowController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of Rows',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  newProject = project(
                      pnameController.text,
                      dropdownValue,
                      0,
                      int.parse(stitchController.text),
                      0,
                      int.parse(rowController.text));
                  setState(() {
                    globals.projectsList.add(newProject);
                  });
                  toProjectsPage();
                },
                child: Text('Save')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toSettingsPage,
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}

class DropdownButtonB extends StatefulWidget {
  const DropdownButtonB({super.key});

  @override
  State<DropdownButtonB> createState() => _DropdownButtonStateB();
}

class _DropdownButtonStateB extends State<DropdownButtonB> {
  String dropdownValue = stitchList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: stitchList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
