import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';

import 'package:daily_meals/screens/categories_screen.dart';
import 'package:daily_meals/screens/favorites_screen.dart';
import 'package:daily_meals/widgets/main_drawer_widget.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorites;
  TabsScreen(this.favorites, {Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return buildTabOntheBottom(context);
  }

  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages = [];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(this.widget.favorites), 'title': 'Favorites'}
    ];
  }

  Widget buildTabOntheBottom(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            //  backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }

  Widget buildTabOntheTop(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.category), text: 'Categories'),
            Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(this.widget.favorites),
        ]),
      ),
    );
  }
}
