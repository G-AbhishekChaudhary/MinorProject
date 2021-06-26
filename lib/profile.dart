import 'package:flutter/material.dart';
import 'package:task4/sharedPref.dart';
import 'package:task4/user.dart';
import 'InputDeco_design.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 50,
                  child: Image.asset("images/account.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 0),
              child: TextFormField(
                enabled: false,
                initialValue: '' + userLoad.name,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(Icons.person, "Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 25, bottom: 0),
              child: TextFormField(
                initialValue: '' + userLoad.email,
                enabled: false,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(Icons.email, "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 25, bottom: 0),
              child: TextFormField(
                enabled: false,
                initialValue: '' + userLoad.phoneno,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(Icons.phone, "Phoneno"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
