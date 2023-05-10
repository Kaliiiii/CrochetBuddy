import 'package:flutter/material.dart';
import 'NewProject.dart';
import 'Settings.dart';
import 'project_data.dart';
import 'globals.dart' as globals;

project currProject = project('', '', 0, 0, 0, 0);
int currIndex = 0;
List<String> stitchList = ['slip', 'single', 'double', 'triple'];

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key, required this.title});

  final String title;

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  void toSettingsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(title: 'Settings')));
  }

  void toNewProjectPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewProjectPage(title: 'New Project')));
  }

  void toProjCouter() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjCounterPage(title: 'Project Counter')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            IconButton(
              icon: const Icon(Icons.add_circle_outlined),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                toNewProjectPage();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
            return IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                toNewProjectPage();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: globals.projectsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                onTap: () {
                  setState(() {});
                  currProject = globals.projectsList[index];
                  currIndex = index;
                  toProjCouter();
                },
                title: Container(
                  height: 50,
                  color: Colors.cyan,
                  child: Center(child: Text(globals.projectsList[index].name)),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: toSettingsPage,
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}

class ProjCounterPage extends StatefulWidget {
  const ProjCounterPage({super.key, required this.title});

  final String title;

  @override
  State<ProjCounterPage> createState() => _ProjCounterPageState();
}

class _ProjCounterPageState extends State<ProjCounterPage> {
  String pName = currProject.name;
  String stitchType = currProject.stitchType;
  int _stiches = currProject.curStitch;
  int _totalStiches = currProject.totalStich;
  int _countStichesBy = globals.cntByStitch;
  int _rows = currProject.curRow;
  int _totalRows = currProject.totalRows;
  int _countRowsBy = globals.cntByRow;

  void toSettingsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(title: 'Settings')));
  }

  void _incrementStiches() {
    setState(() {
      _stiches = _stiches + _countStichesBy;
      globals.projectsList[currIndex].curStitch = _stiches;
    });
  }

  void _incrementRows() {
    setState(() {
      _rows = _rows + _countRowsBy;
      globals.projectsList[currIndex].curRow = _rows;
    });
  }

  void _resetRows() {
    setState(() {
      _rows = 0;
      globals.projectsList[currIndex].curRow = _rows;
    });
  }

  void _resetStitchs() {
    setState(() {
      _stiches = 0;
      globals.projectsList[currIndex].curStitch = _stiches;
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
            Padding(
              padding: EdgeInsets.all(15), //apply padding to all four sides
              child: Text(currProject.name,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Text(currProject.stitchType,
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              'Add Stich',
              style: Theme.of(context).textTheme.titleMedium,
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
              style: Theme.of(context).textTheme.titleMedium,
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
              'Stich Number : $_stiches / $_totalRows ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Row Number : $_rows / $_totalStiches',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ElevatedButton(
              onPressed: () {
                _resetStitchs();
              },
              child: Text('Reset Stitches'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
            ),
            ElevatedButton(
              onPressed: () {
                _resetRows();
              },
              child: Text('Reset Rows'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
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
