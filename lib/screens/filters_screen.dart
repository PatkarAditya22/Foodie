import 'package:flutter/material.dart';
import '../widgets/my_alert.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> _filters;
  FiltersScreen(this._filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _glucoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget._filters['gluten'];
    _glucoseFree = widget._filters['glucose'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Filters',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                final _filterData = {
                  'gluten': _glutenFree,
                  'glucose': _glucoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                MyAlert();
                widget.saveFilters(_filterData);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Meal Selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: SwitchListTile(
                      title: Text('Gluten-free'),
                      secondary: Icon(Icons.filter_1),
                      activeColor: Colors.yellow[800],
                      activeTrackColor: Colors.green[700],
                      subtitle: Text('Only include gluten-free meals'),
                      value: _glutenFree,
                      onChanged: (newvalue) {
                        setState(() {
                          _glutenFree = newvalue;
                        });
                      },
                    ),
                  ),
                  Card(
                    child: SwitchListTile(
                      title: Text('Vegetarian'),
                      secondary: Icon(Icons.filter_2),
                      activeColor: Colors.yellow[800],
                      activeTrackColor: Colors.green[700],
                      subtitle: Text('Only include vegetarian meals'),
                      value: _vegetarian,
                      onChanged: (newvalue) {
                        setState(() {
                          _vegetarian = newvalue;
                        });
                      },
                    ),
                  ),
                  Card(
                    child: SwitchListTile(
                      title: Text('Glucose-free'),
                      secondary: Icon(Icons.filter_3),
                      activeColor: Colors.yellow[800],
                      activeTrackColor: Colors.green[700],
                      subtitle: Text('Only include glucose-free meals'),
                      value: _glucoseFree,
                      onChanged: (newvalue) {
                        setState(() {
                          _glucoseFree = newvalue;
                        });
                      },
                    ),
                  ),
                  Card(
                    child: SwitchListTile(
                      title: Text('Vegan'),
                      activeColor: Colors.yellow[800],
                      activeTrackColor: Colors.green[700],
                      secondary: Icon(Icons.filter_4),
                      subtitle: Text('Only include vegan meals'),
                      value: _vegan,
                      onChanged: (newvalue) {
                        setState(() {
                          _vegan = newvalue;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 350),
              child: RaisedButton(
                color: Colors.pink[200],
                child: Text(
                  'Add filter',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/');
                },
              ),
            ),
          ],
        ));
  }
}
