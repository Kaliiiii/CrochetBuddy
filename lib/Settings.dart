import 'package:flutter/material.dart';
import 'globals.dart' as globals;

const List<String> lista = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '9',
  '10'
];
int row = 0;
int stitch = 0;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  final stitchCntController = TextEditingController();
  final rowCntController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    stitchCntController.dispose();
    rowCntController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Settings'),
            ),
            TextField(
              controller: stitchCntController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Count Stiches By',
              ),
            ),
            TextField(
              controller: rowCntController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Count Rows By',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  globals.cntByStitch = int.parse(stitchCntController.text);
                  globals.cntByRow = int.parse(rowCntController.text);
                },
                child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
