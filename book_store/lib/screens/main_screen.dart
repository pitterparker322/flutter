import 'package:flutter/material.dart';
import 'package:book_store/screens/upload_screen.dart';
import 'package:book_store/screens/browse_screen.dart';
import 'package:book_store/screens/feedback_screen.dart';
import 'package:book_store/screens/home_screen.dart';
import 'package:book_store/screens/settings_screen.dart';
import 'package:book_store/screens/about_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomeScreen(),
    BrowseScreen(),
    UploadScreen(),
    FeedbackScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 37, 37),
      appBar: AppBar(
        title: Text(
          'Abyssinia',
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.black]),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const ImageIcon(AssetImage('assets/menu.png'), size: 5),
            );
          },
        ),

        actions: [
          Form(
            key: GlobalKey(
              debugLabel: 'searchForm',
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      height: 50,
                      width: 180,
                      child:  TextFormField(
                        decoration: InputDecoration(
                          label: Text('search', style: TextStyle(color: Colors.black)),
                          fillColor: Colors.white30,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                      ),
                    onTap: (){
                      // seraching functionality goes here
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery, color: Colors.white, size: 40),
            label: 'Broswe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload, color: Colors.white, size: 40),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback, color: Colors.white, size: 40),
            label: 'Feedback',
          ),
        ],
        onTap: _onItemTapped,
      ),

      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.white]),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  children: [
                    ClipRect(
                      child: Image.asset(
                        'assets/launch_and_icon.png',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      'Abyssinia Book \nStore',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsScreen(),
                      ),
                    );
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.white),
                title: Text('About', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}
