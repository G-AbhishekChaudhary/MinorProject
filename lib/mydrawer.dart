import 'package:flutter/material.dart';
import 'package:task4/main.dart';
import 'profile.dart';
import 'contact.dart';
import 'sharedPref.dart';
import 'user.dart';

class NavigatorDrawer extends StatefulWidget {
  @override
  _NavigatorDrawerState createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  String newuser;
  User userLoad = User();
  SharedPref sharedPref = SharedPref();
  loadSharePrefs() async {
    try {
      User user = User.fromJson(await sharedPref.read("user"));
      setState(() {
        userLoad = user;
      });
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    loadSharePrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 60,
              ),
            ),
            accountName: Text("" + (userLoad.name ?? "")),
            accountEmail: Text("" + (userLoad.email ?? "")),
          ),
          ListTile(
            leading: Icon(Icons.contacts, color: Colors.black),
            title: Text("Contact Us", style: TextStyle(color: Colors.black)),
            hoverColor: Colors.lightGreen,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Contact(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.black),
            title: Text("Profile", style: TextStyle(color: Colors.black)),
            hoverColor: Colors.lightGreen,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.black),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
            hoverColor: Colors.lightGreen,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Logout", style: TextStyle(color: Colors.red))
                    ],
                  ),
                  content: Text(
                    "Do you want to logout",
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          sharedPref.remove("user");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: new Text("Logout Successfully"),
                              duration: const Duration(milliseconds: 500)));
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (content) => MyApp()));
                        },
                        child: Text("Yes")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
