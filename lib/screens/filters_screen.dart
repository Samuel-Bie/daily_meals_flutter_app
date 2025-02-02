import 'package:flutter/material.dart';

import 'package:daily_meals/widgets/main_drawer_widget.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function updateFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen({Key key, this.currentFilters, this.updateFilters})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = true;
  bool _vegetarian = true;
  bool _lactoseFree = true;

  @override
  void initState() {
    super.initState();
    _glutenFree = this.widget.currentFilters['gluten'];
    _vegan = this.widget.currentFilters['vegan'];
    _vegetarian = this.widget.currentFilters['vegetarian'];
    _lactoseFree = this.widget.currentFilters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _filters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                };

                this.widget.updateFilters(_filters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajust your Meal selections',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              MySwitchTile(
                value: _glutenFree,
                text: 'Is gluten free',
                handler: (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                },
                description: 'Shows gluten free meals',
              ),
              MySwitchTile(
                value: _vegan,
                text: 'Is vegan',
                handler: (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                },
                description: 'Shows vegan meals',
              ),
              MySwitchTile(
                value: _vegetarian,
                text: 'Is vegetarian',
                handler: (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                },
                description: 'Shows vegetarian meals',
              ),
              MySwitchTile(
                value: _lactoseFree,
                text: 'Is lactose free',
                handler: (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                },
                description: 'Shows lactose free meals',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class MySwitchTile extends StatelessWidget {
  const MySwitchTile({
    Key key,
    @required this.value,
    @required this.text,
    @required this.handler,
    this.description,
  });

  final bool value;
  final String text;
  final Function handler;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(this.text),
      value: this.value,
      subtitle: Text(this.description),
      onChanged: handler,
    );
  }
}
