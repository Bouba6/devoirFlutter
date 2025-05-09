import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/menu_item.dart';

class layoutPage extends StatefulWidget {
  Widget contentPage;
  layoutPage({super.key, required this.contentPage});

  @override
  State<layoutPage> createState() => _layoutPageState();
}

int _selectedIndex = 0;
final routeNme = ['/', '/eleves'];

class _layoutPageState extends State<layoutPage> {
  final menuItems = [
    menuItemPage(
      text: 'Comptes',
      icon: Icons.list,
      action: (context) {
        Navigator.pushNamed(context, '/');
      },
    ),
    menuItemPage(
      text: 'Ajouter',
      icon: Icons.add,
      action: (context) {
        Navigator.pushNamed(context, '/eleves');
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            for (var item in menuItems) item,
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Home Page')),
      body: widget.contentPage,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pushNamed(context, routeNme[index]);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
      ),
    );
  }
}
