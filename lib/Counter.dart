import 'package:flutter/material.dart';
import 'Settings.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  void toSettingsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(title: 'Settings')));
  }

  static int _stiches = 0;
  static int _countStichesBy = 5;
  static int _rows = 0;
  static int _countRowsBy = 1;

  void _incrementStiches() {
    setState(() {
      _stiches = _stiches + _countStichesBy;
    });
  }

  void _incrementRows() {
    setState(() {
      _rows = _rows + _countRowsBy;
    });
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
            Text(
              'Add Stich',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                _incrementStiches();
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
            ),
            Text(
              'Add Row',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                _incrementRows();
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
            ),
            Text(
              'Stich Number : $_stiches',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Row Number : $_rows',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
