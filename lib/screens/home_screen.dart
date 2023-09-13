
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExample();
}

class _BottomNavigationBarExample extends State<BottomNavigationBarExample> {

  Future<void> _navigatorAndDisplaySelection(BuildContext context) async {
    const result = "Home";

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text(result)));
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Compass',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Heart',
      style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
                child:  UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  accountName: Text("George D."),
                  accountEmail: Text("@george31"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.green,
                    backgroundImage: NetworkImage(
                        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/318242085_1191865894767834_7816458926029927140_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=i2Yc6YQYgb0AX_WN8dO&_nc_oc=AQl1F7PgtM-Jj24W7hftn9lJx3Ya8iIYuGfee8kjaiodQVPmjhjawuoSSq3xyVyht5c&_nc_ht=scontent.fhan15-2.fna&oh=00_AfBFutmU6ejRSlZJR4lGEOs6b-4MstjKLPEs17FhUy-ziw&oe=65067090'
                    ),
                  ),
                ),),

            ListTile(
              leading: const Icon(Icons.note_alt_outlined, color: Colors.green),
              title: const Text('My orders'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                // Then close the drawer
                Navigator.pop(context, 'Home');
              },
            ),

            ListTile(
              leading: const Icon(Icons.library_add_check_outlined, color: Colors.green),
              title: const Text('My Subscriptions'),
              onTap: () {
                _navigatorAndDisplaySelection(context);

                Navigator.pop(context, 'Business');
              },
            ),

            ListTile(
              leading: const Icon(Icons.location_on_outlined, color: Colors.green),
              title: const Text('My Addresses'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                Navigator.pop(context, 'School');
              },
            ),

            ListTile(
              leading: const Icon(Icons.question_answer_outlined, color: Colors.green),
              title: const Text('FAQ'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                // Then close the drawer
                Navigator.pop(context, 'Home');
              },
            ),

            ListTile(
              leading: const Icon(Icons.phone_callback_outlined, color: Colors.green),
              title: const Text('Contact Us'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                // Then close the drawer
                Navigator.pop(context, 'Home');
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline_rounded, color: Colors.green),
              title: const Text('About'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                // Then close the drawer
                Navigator.pop(context, 'Home');
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout_outlined, color: Colors.green),
              title: const Text('Log Out'),
              onTap: () {
                _navigatorAndDisplaySelection(context);
                // Then close the drawer
                Navigator.pop(context, 'Home');
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant_navigation),
            label: 'Compass',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken_outlined),
            label: 'Heart',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
